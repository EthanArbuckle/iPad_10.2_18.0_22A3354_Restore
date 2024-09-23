@implementation PFFigCopyImageWithPropertiesAndContainerOptions

uint64_t ___PFFigCopyImageWithPropertiesAndContainerOptions_block_invoke(uint64_t a1, void *a2)
{
  uint64_t DataFromMetadata;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _BYTE buf[12];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    DataFromMetadata = CGImageCreateDataFromMetadata();
    if ((_DWORD)DataFromMetadata)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = DataFromMetadata;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Non-success status %d from CGImageCreateDataFromMetadata()", buf, 8u);
      }
    }
    else
    {
      v4 = 0;
      v5 = 0;
      v6 = a2;
      v7 = *MEMORY[0x1E0D092E0];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D092E0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = objc_msgSend(v8, "integerValue");
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D092D0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 >= objc_msgSend(v11, "count"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v10;
            v18 = 2048;
            v19 = objc_msgSend(v11, "count");
            _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid primary image index %td in container description, image count = %td", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
          {
            *(_QWORD *)buf = v4;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D092C8]);

          }
          if (v5)
          {
            v16 = v5;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D092F0]);

          }
        }

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v7;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected missing %@ key in container description", buf, 0xCu);
      }

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil container description", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
  return DataFromMetadata;
}

@end
