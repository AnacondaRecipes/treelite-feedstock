mkdir build	
cd build	
cmake .. -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -GNinja	
if errorlevel 1 exit 1	
ninja install	
if errorlevel 1 exit 1	
cd ../python
:: --config-settings use_system_libtreelite=True tells treelite's custom
:: packager.pep517 backend to skip building libtreelite from source and to
:: NOT bundle a copy in the wheel; the runtime libpath.py finds it at
:: %LIBRARY_BIN%\treelite.dll via sys.base_prefix.
python -m pip install . -vv --no-deps --no-build-isolation --config-settings use_system_libtreelite=True
if errorlevel 1 exit 1
