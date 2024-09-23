@implementation AXPhoenixDataArchiver

- (AXPhoenixDataArchiver)initWithPath:(id)a3
{
  id v3;
  os_log_t oslog;
  int v6;
  objc_super v7;
  id location[2];
  id v9;
  AXPhoenixDataArchiver *v10;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AXPhoenixDataArchiver;
  v9 = -[AXPhoenixDataArchiver init](&v7, sel_init);
  objc_storeStrong(&v9, v9);
  if (!v9)
    goto LABEL_7;
  objc_msgSend(v9, "setArchiver:", archive_write_new());
  objc_msgSend(v9, "archiver");
  archive_write_add_filter_gzip();
  objc_msgSend(v9, "archiver");
  archive_write_set_format_ustar();
  objc_msgSend(v9, "archiver");
  objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String");
  v6 = archive_write_open_filename();
  if (!v6)
  {
    chmod((const char *)objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String"), 0x1B4u);
LABEL_7:
    v10 = (AXPhoenixDataArchiver *)v9;
    goto LABEL_8;
  }
  oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_3_8_32_8_64_4_0((uint64_t)v11, (uint64_t)"-[AXPhoenixDataArchiver initWithPath:]", (uint64_t)location[0], v6);
    _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating archive at path %@ %d", v11, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v9, 0);
  v10 = 0;
LABEL_8:
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (void)addFileToArchive:(id)a3 withFileName:(id)a4
{
  int *v4;
  id v5;
  os_log_t v7;
  int v8;
  os_log_type_t type;
  os_log_t oslog;
  char *v11;
  int v12;
  ssize_t i;
  stat __b;
  uint64_t v15;
  id v16;
  id location[2];
  AXPhoenixDataArchiver *v18;
  uint8_t v19[32];
  uint8_t v20[24];
  _BYTE v21[8192];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  memset(&__b, 0, sizeof(__b));
  i = 0;
  v12 = 0;
  v11 = (char *)objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String");
  if (v11)
  {
    stat(v11, &__b);
    v15 = archive_entry_new();
    archive_entry_copy_stat();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    archive_entry_set_pathname();
    -[AXPhoenixDataArchiver archiver](v18, "archiver");
    archive_write_header();
    v12 = open(v11, 0);
    if (v12 == -1)
    {
      v7 = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v5 = location[0];
        v4 = __error();
        __os_log_helper_16_2_3_8_32_8_64_4_0((uint64_t)v19, (uint64_t)"-[AXPhoenixDataArchiver addFileToArchive:withFileName:]", (uint64_t)v5, *v4);
        _os_log_impl(&dword_228CDB000, v7, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Error opening file %@:%d", v19, 0x1Cu);
      }
      objc_storeStrong((id *)&v7, 0);
      v8 = 1;
    }
    else
    {
      for (i = read(v12, v21, 0x2000uLL); i > 0; i = read(v12, v21, 0x2000uLL))
      {
        -[AXPhoenixDataArchiver archiver](v18, "archiver");
        archive_write_data();
      }
      archive_entry_free();
      close(v12);
      v8 = 0;
    }
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v20, (uint64_t)"-[AXPhoenixDataArchiver addFileToArchive:withFileName:]");
      _os_log_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Error, requested to add nil file to archive", v20, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v4;
  id v5;
  AXPhoenixDataArchiver *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  AXPhoenixDataArchiver *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD __b[8];
  id v26;
  char v27;
  id v28;
  id v29;
  id location[2];
  AXPhoenixDataArchiver *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v21 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v28 = (id)objc_msgSend(v21, "contentsOfDirectoryAtPath:error:", location[0], 0);

  v27 = 0;
  memset(__b, 0, sizeof(__b));
  v22 = v28;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
  if (v23)
  {
    v17 = *(_QWORD *)__b[2];
    v18 = 0;
    v19 = v23;
    while (1)
    {
      v16 = v18;
      if (*(_QWORD *)__b[2] != v17)
        objc_enumerationMutation(v22);
      v26 = *(id *)(__b[1] + 8 * v18);
      v24 = (id)objc_msgSend(location[0], "stringByAppendingPathComponent:", v26);
      v14 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v24, &v27);

      if ((v15 & 1) != 0)
      {
        if ((v27 & 1) != 0)
        {
          v11 = v31;
          v10 = v24;
          v9 = v29;
          v13 = (id)objc_msgSend(v26, "lastPathComponent");
          v12 = (id)objc_msgSend(v9, "stringByAppendingPathComponent:");
          -[AXPhoenixDataArchiver addDirectoryToArchive:withDirName:](v11, "addDirectoryToArchive:withDirName:", v10);

        }
        else
        {
          v6 = v31;
          v5 = v24;
          v4 = v29;
          v8 = (id)objc_msgSend(v26, "lastPathComponent");
          v7 = (id)objc_msgSend(v4, "stringByAppendingPathComponent:");
          -[AXPhoenixDataArchiver addFileToArchive:withFileName:](v6, "addFileToArchive:withFileName:", v5);

        }
      }
      objc_storeStrong(&v24, 0);
      ++v18;
      if (v16 + 1 >= v19)
      {
        v18 = 0;
        v19 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
        if (!v19)
          break;
      }
    }
  }

  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)closeArchive
{
  -[AXPhoenixDataArchiver archiver](self, "archiver", a2, self);
  archive_write_free();
}

- (archive)archiver
{
  return self->_archiver;
}

- (void)setArchiver:(archive *)a3
{
  self->_archiver = a3;
}

@end
