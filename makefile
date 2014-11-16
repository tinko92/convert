BOOST_ROOT = $(HOME)/dev/boost

cflags    = -O3 -Iinclude -I$(BOOST_ROOT) -Wno-unused-local-typedefs -Wno-unused-variable -Wno-uninitialized
ldflags   = -L$(HOME)/dev/lib -lboost_timer -lboost_system -lboost_chrono -lrt

target_1  = convert-test-has-memfun
target_2  = convert-test-callable
target_3  = convert-test-is-converter
target_4  = convert-test-fallbacks
target_5  = convert-test-spirit-converter
target_6  = convert-test-stream-converter
target_7  = convert-test-lcast-converter
target_8  = convert-test-printf-converter
target_9  = convert-test-strtol-converter
target_10 = convert-test-encryption
target_11 = convert-test-user-type
target_12 = convert-test-str-to-int

sources_1  = test/has_memfun.cpp
sources_2  = test/callable.cpp
sources_3  = test/is_converter.cpp
sources_4  = test/fallbacks.cpp
sources_5  = test/spirit_converter.cpp
sources_6  = test/stream_converter.cpp
sources_7  = test/lcast_converter.cpp
sources_8  = test/printf_converter.cpp
sources_9  = test/strtol_converter.cpp
sources_10 = test/encryption.cpp
sources_11 = test/user_type.cpp
sources_12 = test/str_to_int.cpp

target_21 = convert-test-performance
target_22 = convert-test-performance-spirit
target_23 = convert-example-algorithms
target_24 = convert-example-default_converter
target_25 = convert-example-getting_serious
target_26 = convert-example-getting_started
target_27 = convert-example-lexical_cast
target_28 = convert-example-stream

sources_21 = test/performance.cpp
sources_22 = test/performance_spirit.cpp
sources_23 = example/algorithms.cpp
sources_24 = example/default_converter.cpp
sources_25 = example/getting_serious.cpp
sources_26 = example/getting_started.cpp
sources_27 = example/lexical_cast.cpp
sources_28 = example/stream.cpp

ifneq ($(DEVMAKE),)

include $(DEVMAKE)/makefile

else

all: convert-test convert-test-performance convert-test-performance-spirit

convert-test-performance-spirit: test/performance_spirit.cpp
	g++ -O3 -o $@ $^ -Iinclude -I$(BOOST_ROOT) $(ldflags)

convert-test-performance:
	g++ -O3 -o $@ $(sources_2) -Iinclude -I$(BOOST_ROOT) $(ldflags)

convert-test:  
	g++ -O3 -o $@ $(sources_1) -Iinclude -I$(BOOST_ROOT)

endif

