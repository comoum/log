# Usage

1. 编译安装
```shell
cmake -G "MinGW Makefiles" ..  
cmake --build . --config Release  
cmake --install . --config Release  
```

2. 引入cmake
```cmake
SET(CMAKE_PREFIX_PATH 此库路径的build文件夹下)
find_package(jelog REQUIRED)
target_link_libraries([target] PRIVATE jelog)
```

3. 使用

```cpp
#include "log.h"

int main() {
    Log::set_log_lev(LogLevel::Debug);
    // 这里只是演示支持各种斜杠，也可以abc/tmp/def/log.log
    Log::set_log_file("abc/tmp/def\\log.log");
    if (!Log::init()) {
        return -1;
    }
    Log::write_console(false);
    DEBUG("{}", 111);
    INFO("{}", 222);
    WARN("{}", 333);

    Struct s("abc", 123);
    ERROR("{}", s);
    return 0;
}
```
