@implementation SCROBrailleDisplayAutoDetector

+ (id)sharedDetector
{
  return (id)_SCROBrailleDisplayAutoDetector;
}

+ (void)initialize
{
  SCROBrailleDisplayAutoDetector *v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(SCROBrailleDisplayAutoDetector);
    v3 = (void *)_SCROBrailleDisplayAutoDetector;
    _SCROBrailleDisplayAutoDetector = (uint64_t)v2;

  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v4;

  if (_SCROBrailleDisplayAutoDetector)
    return 0;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SCROBrailleDisplayAutoDetector;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (SCROBrailleDisplayAutoDetector)init
{
  SCROBrailleDisplayAutoDetector *v2;
  uint64_t v3;
  NSMutableArray *bleIdentifiers;
  objc_super v6;

  v2 = self;
  if (!_SCROBrailleDisplayAutoDetector)
  {
    v6.receiver = self;
    v6.super_class = (Class)SCROBrailleDisplayAutoDetector;
    v2 = -[SCROBrailleDisplayAutoDetector init](&v6, sel_init);
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v3 = objc_claimAutoreleasedReturnValue();
      bleIdentifiers = v2->_bleIdentifiers;
      v2->_bleIdentifiers = (NSMutableArray *)v3;

    }
  }
  return v2;
}

- (BOOL)isAutoDetectEnabled
{
  return self->_isDetectingDisplays;
}

- (id)_driverBundleIdentifiers
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  BOOL v8;

  objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverDeviceDetectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFPreferencesGetAppBooleanValue(CFSTR("SCROBrailleDriverReverseUSBLoadOrder"), (CFStringRef)*MEMORY[0x24BED26B8], 0) != 0;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SCROBrailleDisplayAutoDetector__driverBundleIdentifiers__block_invoke;
  v7[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  v8 = v3;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__SCROBrailleDisplayAutoDetector__driverBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "caseInsensitiveCompare:");
  v4 = 1;
  if (result == 1)
    v5 = -1;
  else
    v5 = result;
  if (result != -1)
    v4 = v5;
  if (*(_BYTE *)(a1 + 32))
    return v4;
  return result;
}

- (void)detectDisplays
{
  NSMutableDictionary *v3;
  NSMutableDictionary *iteratorDict;
  id v5;

  if (!self->_isDetectingDisplays)
  {
    if (!self->_iteratorDict)
    {
      v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      iteratorDict = self->_iteratorDict;
      self->_iteratorDict = v3;

    }
    self->_notificationPort = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    -[SCROBrailleDisplayAutoDetector _driverBundleIdentifiers](self, "_driverBundleIdentifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleDisplayAutoDetector _autodetectIOServices:](self, "_autodetectIOServices:", v5);
    -[SCROBrailleDisplayAutoDetector _initializeAutodetectSerialPorts:](self, "_initializeAutodetectSerialPorts:", v5);

  }
}

- (void)_openSerialPortService:(id)a3 sortedDriverBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int *v16;
  char *v17;
  int v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int *v24;
  char *v25;
  int v26;
  NSObject *v27;
  int *v28;
  char *v29;
  int v30;
  NSObject *v31;
  int *v32;
  char *v33;
  int v34;
  NSObject *v35;
  int *v36;
  char *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  int *v42;
  char *v43;
  int v44;
  NSObject *v45;
  int *v46;
  char *v47;
  int v48;
  const char *v49;
  int *v50;
  char *v51;
  int v52;
  int *v53;
  char *v54;
  int v55;
  int *v56;
  char *v57;
  int v58;
  int *v59;
  char *v60;
  int v61;
  NSObject *v62;
  OS_dispatch_source *v63;
  OS_dispatch_source *serialSource;
  NSObject *v65;
  uint64_t v66;
  dispatch_time_t v67;
  _QWORD block[5];
  _QWORD handler[5];
  id v70;
  termios *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  char *v79;
  __int16 v80;
  int v81;
  termios v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v75 = 0;
  memset(&v82, 0, sizeof(v82));
  v10 = open(v9, 131078);
  if (v10 == -1)
  {
    _SCROD_LOG();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = __error();
      v43 = strerror(*v42);
      v44 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v43;
      v80 = 1024;
      v81 = v44;
      _os_log_impl(&dword_2115BB000, v41, OS_LOG_TYPE_DEFAULT, "Error opening serial port %s - %s(%d).\n", buf, 0x1Cu);
    }

    goto LABEL_56;
  }
  v11 = v10;
  if (ioctl(v10, 0x2000740DuLL) == -1)
  {
    _SCROD_LOG();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    v46 = __error();
    v47 = strerror(*v46);
    v48 = *__error();
    *(_DWORD *)buf = 136315650;
    v77 = v9;
    v78 = 2080;
    v79 = v47;
    v80 = 1024;
    v81 = v48;
    v49 = "Error setting TIOCEXCL on %s - %s(%d).\n";
LABEL_54:
    _os_log_impl(&dword_2115BB000, v45, OS_LOG_TYPE_DEFAULT, v49, buf, 0x1Cu);
    goto LABEL_55;
  }
  if (fcntl(v11, 4, 0) == -1)
  {
    _SCROD_LOG();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    v50 = __error();
    v51 = strerror(*v50);
    v52 = *__error();
    *(_DWORD *)buf = 136315650;
    v77 = v9;
    v78 = 2080;
    v79 = v51;
    v80 = 1024;
    v81 = v52;
    v49 = "Error clearing O_NONBLOCK %s - %s(%d).\n";
    goto LABEL_54;
  }
  if (tcgetattr(v11, (termios *)gOriginalTTYAttrs) == -1)
  {
    _SCROD_LOG();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    v53 = __error();
    v54 = strerror(*v53);
    v55 = *__error();
    *(_DWORD *)buf = 136315650;
    v77 = v9;
    v78 = 2080;
    v79 = v54;
    v80 = 1024;
    v81 = v55;
    v49 = "Error getting tty attributes %s - %s(%d).\n";
    goto LABEL_54;
  }
  v82 = *(termios *)gOriginalTTYAttrs;
  _SCROD_LOG();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v77) = cfgetispeed(&v82);
    _os_log_impl(&dword_2115BB000, v12, OS_LOG_TYPE_DEFAULT, "Current input baud rate is %d\n", buf, 8u);
  }

  _SCROD_LOG();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = cfgetospeed(&v82);
    *(_DWORD *)buf = 67109120;
    LODWORD(v77) = v14;
    _os_log_impl(&dword_2115BB000, v13, OS_LOG_TYPE_DEFAULT, "Current output baud rate is %d\n", buf, 8u);
  }

  cfmakeraw(&v82);
  *(_WORD *)&v82.c_cc[16] = 2560;
  cfsetspeed(&v82, 0x4B00uLL);
  v82.c_cflag |= 0x300uLL;
  v74 = 14400;
  if (ioctl(v11, 0x80085402uLL, &v74) == -1)
  {
    _SCROD_LOG();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = __error();
      v17 = strerror(*v16);
      v18 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v17;
      v80 = 1024;
      v81 = v18;
      _os_log_impl(&dword_2115BB000, v15, OS_LOG_TYPE_DEFAULT, "Error calling ioctl(..., IOSSIOSPEED, ...) %s - %s(%d).\n", buf, 0x1Cu);
    }

  }
  _SCROD_LOG();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = cfgetispeed(&v82);
    *(_DWORD *)buf = 67109120;
    LODWORD(v77) = v20;
    _os_log_impl(&dword_2115BB000, v19, OS_LOG_TYPE_DEFAULT, "Input baud rate changed to %d\n", buf, 8u);
  }

  _SCROD_LOG();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = cfgetospeed(&v82);
    *(_DWORD *)buf = 67109120;
    LODWORD(v77) = v22;
    _os_log_impl(&dword_2115BB000, v21, OS_LOG_TYPE_DEFAULT, "Output baud rate changed to %d\n", buf, 8u);
  }

  if (tcsetattr(v11, 0, &v82) == -1)
  {
    _SCROD_LOG();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    v56 = __error();
    v57 = strerror(*v56);
    v58 = *__error();
    *(_DWORD *)buf = 136315650;
    v77 = v9;
    v78 = 2080;
    v79 = v57;
    v80 = 1024;
    v81 = v58;
    v49 = "Error setting tty attributes %s - %s(%d).\n";
    goto LABEL_54;
  }
  if (ioctl(v11, 0x20007479uLL) == -1)
  {
    _SCROD_LOG();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = __error();
      v25 = strerror(*v24);
      v26 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v25;
      v80 = 1024;
      v81 = v26;
      _os_log_impl(&dword_2115BB000, v23, OS_LOG_TYPE_DEFAULT, "Error asserting DTR %s - %s(%d).\n", buf, 0x1Cu);
    }

  }
  if (ioctl(v11, 0x20007478uLL) == -1)
  {
    _SCROD_LOG();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = __error();
      v29 = strerror(*v28);
      v30 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v29;
      v80 = 1024;
      v81 = v30;
      _os_log_impl(&dword_2115BB000, v27, OS_LOG_TYPE_DEFAULT, "Error clearing DTR %s - %s(%d).\n", buf, 0x1Cu);
    }

  }
  v75 = 294;
  if (ioctl(v11, 0x8004746DuLL, &v75) == -1)
  {
    _SCROD_LOG();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = __error();
      v33 = strerror(*v32);
      v34 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v33;
      v80 = 1024;
      v81 = v34;
      _os_log_impl(&dword_2115BB000, v31, OS_LOG_TYPE_DEFAULT, "Error setting handshake lines %s - %s(%d).\n", buf, 0x1Cu);
    }

  }
  if (ioctl(v11, 0x4004746AuLL, &v75) == -1)
  {
    _SCROD_LOG();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = __error();
      v37 = strerror(*v36);
      v38 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v37;
      v80 = 1024;
      v81 = v38;
      _os_log_impl(&dword_2115BB000, v35, OS_LOG_TYPE_DEFAULT, "Error getting handshake lines %s - %s(%d).\n", buf, 0x1Cu);
    }

  }
  _SCROD_LOG();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v77) = v75;
    _os_log_impl(&dword_2115BB000, v39, OS_LOG_TYPE_DEFAULT, "Handshake lines currently set to %d\n", buf, 8u);
  }

  v73 = 1;
  if (ioctl(v11, 0x80085400uLL, &v73) == -1)
  {
    _SCROD_LOG();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v59 = __error();
      v60 = strerror(*v59);
      v61 = *__error();
      *(_DWORD *)buf = 136315650;
      v77 = v9;
      v78 = 2080;
      v79 = v60;
      v80 = 1024;
      v81 = v61;
      v49 = "Error setting read latency %s - %s(%d).\n";
      goto LABEL_54;
    }
LABEL_55:

    close(v11);
LABEL_56:
    v11 = -1;
    _fd = -1;
    goto LABEL_57;
  }
  _fd = v11;
  if (v11)
  {
LABEL_57:
    v62 = MEMORY[0x24BDAC9B8];
    v63 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], v11, 0, MEMORY[0x24BDAC9B8]);
    serialSource = self->_serialSource;
    self->_serialSource = v63;

    v82.c_iflag = 0;
    v82.c_oflag = (tcflag_t)&v82;
    v82.c_cflag = 0x2020000000;
    LOBYTE(v82.c_lflag) = 0;
    v65 = self->_serialSource;
    v66 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke;
    handler[3] = &unk_24CC1D420;
    v72 = v11;
    handler[4] = self;
    v71 = &v82;
    v70 = v7;
    dispatch_source_set_event_handler(v65, handler);
    dispatch_resume((dispatch_object_t)self->_serialSource);
    v67 = dispatch_time(0, 5000000000);
    block[0] = v66;
    block[1] = 3221225472;
    block[2] = __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_12;
    block[3] = &unk_24CC1D370;
    block[4] = &v82;
    dispatch_after(v67, v62, block);

    _Block_object_dispose(&v82, 8);
    goto LABEL_58;
  }
  _SCROD_LOG();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v82.c_iflag) = 138412290;
    *(tcflag_t *)((char *)&v82.c_iflag + 4) = (tcflag_t)v8;
    _os_log_impl(&dword_2115BB000, v40, OS_LOG_TYPE_DEFAULT, "Could not open service: %@", (uint8_t *)&v82, 0xCu);
  }

LABEL_58:
}

void __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  int handle;
  ssize_t v4;
  uint64_t v5;
  unint64_t v6;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _DWORD v16[4];
  uint8_t buf[520];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    handle = dispatch_source_get_handle(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = read(handle, buf, 0x200uLL);
    if (v4 == -1)
      break;
    v5 = v4;
    objc_msgSend(v2, "appendBytes:length:", buf, v4);
    v6 = objc_msgSend(v2, "length");
    if (v5 < 1 || v6 >= 0x11)
    {
      if (v5 < 1)
        goto LABEL_19;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_serialDataMatchesDriver:driverBundleIdentifiers:fileDescriptor:", v2, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
      v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      _SCROD_LOG();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          v11 = "Found matching driver.  Will connect.";
          goto LABEL_17;
        }
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        v11 = "This serial device did not match.";
LABEL_17:
        _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      }

      dispatch_source_set_event_handler(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8), 0);
      dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8));
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 8);
      *(_QWORD *)(v14 + 8) = 0;

      goto LABEL_19;
    }
  }
  _SCROD_LOG();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(_DWORD *)(a1 + 56);
    v16[0] = 67109120;
    v16[1] = v13;
    _os_log_impl(&dword_2115BB000, v12, OS_LOG_TYPE_INFO, "Serial device: %d Could not read any data", (uint8_t *)v16, 8u);
  }

LABEL_19:
}

void __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_12(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_2;
  block[3] = &unk_24CC1D370;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t result;
  BOOL v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = _fd;
  if (v1)
    v3 = 1;
  else
    v3 = _fd == 0;
  if (!v3)
  {
    tcdrain(_fd);
    return close(_fd);
  }
  return result;
}

- (BOOL)_serialDataMatchesDriver:(id)a3 driverBundleIdentifiers:(id)a4 fileDescriptor:(int)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SCROIOSerialElement *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  BOOL v33;
  SCROIOSerialElement *v34;
  NSObject *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  SCROIOSerialElement *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  SCROIOSerialElement *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverDeviceDetectionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v62;
    v45 = v9;
    v46 = v8;
    v38 = *(_QWORD *)v62;
    do
    {
      v12 = 0;
      v37 = v10;
      do
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v9);
        v41 = v12;
        v13 = *(SCROIOSerialElement **)(*((_QWORD *)&v61 + 1) + 8 * v12);
        objc_msgSend(v8, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", kSCROBrailleDriverAutoDetectDictionaries[0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        _SCROD_LOG();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v13;
          _os_log_impl(&dword_2115BB000, v16, OS_LOG_TYPE_DEFAULT, "Testing match for %@", buf, 0xCu);
        }

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v17 = v15;
        v42 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        if (v42)
        {
          v18 = *(_QWORD *)v58;
          v39 = *(_QWORD *)v58;
          v40 = v13;
          v47 = v17;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v58 != v18)
                objc_enumerationMutation(v17);
              v43 = v19;
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v19), "objectForKeyedSubscript:", kSCROBrailleDriverSerialAdvertiseBytes[0]);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              v56 = 0u;
              obj = v20;
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v54;
                while (2)
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v54 != v23)
                      objc_enumerationMutation(obj);
                    v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = 0u;
                    v50 = 0u;
                    v51 = 0u;
                    v52 = 0u;
                    objc_msgSend(v25, "componentsSeparatedByString:", CFSTR("\\x"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                    if (v28)
                    {
                      v29 = v28;
                      v30 = *(_QWORD *)v50;
                      do
                      {
                        for (j = 0; j != v29; ++j)
                        {
                          if (*(_QWORD *)v50 != v30)
                            objc_enumerationMutation(v27);
                          v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                          if (objc_msgSend(v32, "length"))
                          {
                            buf[0] = 0;
                            buf[0] = strtol((const char *)objc_msgSend(objc_retainAutorelease(v32), "UTF8String"), 0, 16);
                            objc_msgSend(v26, "appendBytes:length:", buf, 1);
                          }
                        }
                        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                      }
                      while (v29);
                    }

                    if (!objc_msgSend(v6, "rangeOfData:options:range:", v26, 0, 0, objc_msgSend(v6, "length")))
                    {
                      v34 = -[SCROIOSerialElement initWithFileDescriptor:]([SCROIOSerialElement alloc], "initWithFileDescriptor:", a5);
                      _SCROD_LOG();
                      v35 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v69 = v34;
                        _os_log_impl(&dword_2115BB000, v35, OS_LOG_TYPE_DEFAULT, "Matched element: %@", buf, 0xCu);
                      }

                      _postBrailleDisplayDetected(v40, v34);
                      v33 = 1;
                      v9 = v45;
                      v8 = v46;
                      goto LABEL_39;
                    }

                  }
                  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
                  if (v22)
                    continue;
                  break;
                }
              }

              v19 = v43 + 1;
              v9 = v45;
              v8 = v46;
              v17 = v47;
              v18 = v39;
            }
            while (v43 + 1 != v42);
            v42 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          }
          while (v42);
        }

        v12 = v41 + 1;
        v11 = v38;
      }
      while (v41 + 1 != v37);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      v11 = v38;
      v33 = 0;
    }
    while (v10);
  }
  else
  {
    v33 = 0;
  }
LABEL_39:

  return v33;
}

- (id)_serialPortMatchingDictionary
{
  __CFDictionary *v2;

  v2 = IOServiceMatching("IOSerialBSDClient");
  CFDictionarySetValue(v2, CFSTR("IOSerialBSDClientType"), CFSTR("IOSerialStream"));
  return v2;
}

- (void)serialPortsWerePublished:(unsigned int)a3
{
  id v4;

  -[SCROBrailleDisplayAutoDetector _driverBundleIdentifiers](self, "_driverBundleIdentifiers", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplayAutoDetector _detectSerialPorts:](self, "_detectSerialPorts:", v4);

}

- (void)_registerForSerialPortNotifications
{
  void *v3;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  IONotificationPort *notificationPort;
  const __CFDictionary *v7;
  NSObject *v8;
  uint8_t v9[12];
  io_iterator_t notification;

  -[SCROBrailleDisplayAutoDetector _serialPortMatchingDictionary](self, "_serialPortMatchingDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFRunLoopGetCurrent();
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_notificationPort);
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  notification = 0;
  notificationPort = self->_notificationPort;
  v7 = (const __CFDictionary *)CFRetain(v3);
  if (IOServiceAddMatchingNotification(notificationPort, "IOServicePublish", v7, (IOServiceMatchingCallback)_serialPortPublishedCallback, self, &notification))
  {
    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "Could not register for serial publish notification", v9, 2u);
    }

  }
}

- (void)_initializeAutodetectSerialPorts:(id)a3
{
  id v4;

  v4 = a3;
  -[SCROBrailleDisplayAutoDetector _registerForSerialPortNotifications](self, "_registerForSerialPortNotifications");
  -[SCROBrailleDisplayAutoDetector _detectSerialPorts:](self, "_detectSerialPorts:", v4);

}

- (void)_detectSerialPorts:(id)a3
{
  id v4;
  kern_return_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  mach_port_t v10;
  const __CFDictionary *v11;
  kern_return_t MatchingServices;
  kern_return_t v13;
  NSObject *v14;
  io_object_t v15;
  io_registry_entry_t v16;
  const __CFAllocator *v17;
  void *CFProperty;
  NSObject *v19;
  dispatch_time_t v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  io_iterator_t existing;
  mach_port_t v26;
  uint8_t buf[4];
  kern_return_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0;
  v5 = MEMORY[0x212BDD840](0, &v26);
  if (v5
    || (objc_msgSend(MEMORY[0x24BDD1760], "processInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "processName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("scrod")),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    _SCROD_LOG();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v28 = v5;
      _os_log_impl(&dword_2115BB000, v19, OS_LOG_TYPE_DEFAULT, "IOMainPort returned %d\n", buf, 8u);
    }

  }
  else
  {
    existing = 0;
    -[SCROBrailleDisplayAutoDetector _serialPortMatchingDictionary](self, "_serialPortMatchingDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v26;
    v11 = (const __CFDictionary *)CFRetain(v9);
    MatchingServices = IOServiceGetMatchingServices(v10, v11, &existing);
    if (MatchingServices)
    {
      v13 = MatchingServices;
      _SCROD_LOG();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v28 = v13;
        _os_log_impl(&dword_2115BB000, v14, OS_LOG_TYPE_DEFAULT, "IOServiceGetMatchingServices returned %d\n", buf, 8u);
      }

    }
    v15 = IOIteratorNext(existing);
    if (v15)
    {
      v16 = v15;
      v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      while (1)
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v16, CFSTR("IOCalloutDevice"), v17, 0);
        IOObjectRelease(v16);
        if (objc_msgSend(CFProperty, "hasPrefix:", CFSTR("/dev/cu.usbserial")))
          break;

        v16 = IOIteratorNext(existing);
        if (!v16)
          goto LABEL_17;
      }
      v20 = dispatch_time(0, 5000000000);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __53__SCROBrailleDisplayAutoDetector__detectSerialPorts___block_invoke;
      v22[3] = &unk_24CC1D448;
      v22[4] = self;
      v23 = CFProperty;
      v24 = v4;
      v21 = CFProperty;
      dispatch_after(v20, MEMORY[0x24BDAC9B8], v22);

    }
LABEL_17:

  }
}

uint64_t __53__SCROBrailleDisplayAutoDetector__detectSerialPorts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openSerialPortService:sortedDriverBundleIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_autodetectIOServices:(id)a3
{
  id v4;
  IONotificationPort *notificationPort;
  char v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFRunLoop *Current;
  const __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  const __CFDictionary *Copy;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  id v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  __CFRunLoopSource *RunLoopSource;
  id v47;
  const __CFAllocator *allocator;
  SCROBrailleDisplayAutoDetector *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  io_iterator_t notification;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverDeviceDetectionInfo");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  notificationPort = self->_notificationPort;
  v49 = self;
  if (notificationPort)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(notificationPort);
    if (RunLoopSource)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v39 = v4;
      obj = v4;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      if (v43)
      {
        v6 = 0;
        v41 = *(_QWORD *)v64;
        v7 = CFSTR("IOProviderClass");
        v45 = (const __CFString *)*MEMORY[0x24BDBD5A0];
        allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        do
        {
          v8 = 0;
          do
          {
            v9 = v7;
            if (*(_QWORD *)v64 != v41)
              objc_enumerationMutation(obj);
            v44 = v8;
            v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v8);
            objc_msgSend(v42, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKey:", kSCROBrailleDriverAutoDetectDictionaries[0]);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v47 = v12;
            v13 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v60;
              v7 = v9;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v60 != v15)
                    objc_enumerationMutation(v47);
                  v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                  if ((v6 & 1) == 0)
                  {
                    Current = CFRunLoopGetCurrent();
                    CFRunLoopAddSource(Current, RunLoopSource, v45);
                  }
                  notification = 0;
                  objc_msgSend(v17, "objectForKeyedSubscript:", v7);
                  v19 = v7;
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isEqual:", CFSTR("IOUSBDevice"));

                  if (v21)
                  {
                    v22 = (void *)objc_msgSend(v17, "mutableCopy");
                    objc_msgSend(v22, "setObject:forKey:", CFSTR("IOUSBDevice"), v19);
                    Copy = CFDictionaryCreateCopy(allocator, (CFDictionaryRef)v22);

                  }
                  else
                  {
                    Copy = CFDictionaryCreateCopy(allocator, (CFDictionaryRef)v17);
                  }
                  self = v49;
                  v24 = IOServiceAddMatchingNotification(v49->_notificationPort, "IOServiceFirstMatch", Copy, (IOServiceMatchingCallback)_connectHandler, v10, &notification);
                  if ((_DWORD)v24)
                  {
                    NSLog(CFSTR("Error [%d]: while creating matching notification for device: %@"), v24, v10);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", notification);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKey:](v49->_iteratorDict, "objectForKey:", v10);
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (v26)
                    {
                      v27 = (id)v26;
                    }
                    else
                    {
                      v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                      -[NSMutableDictionary setObject:forKey:](v49->_iteratorDict, "setObject:forKey:", v27, v10);
                    }
                    objc_msgSend(v27, "addObject:", v25);

                  }
                  v6 = 1;
                  v7 = v9;
                }
                v14 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
              }
              while (v14);
            }
            else
            {
              v7 = v9;
            }

            v8 = v44 + 1;
          }
          while (v44 + 1 != v43);
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        }
        while (v43);
      }

      v4 = v39;
    }
    self->_isDetectingDisplays = 1;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v28 = v4;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v55 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        -[NSMutableDictionary objectForKey:](self->_iteratorDict, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v51;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v51 != v37)
                objc_enumerationMutation(v34);
              _connectHandler(v33, objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "unsignedIntValue"));
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
          }
          while (v36);
        }

        self = v49;
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v30);
  }

}

- (void)stopDetectingDisplays
{
  IONotificationPort *notificationPort;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *iteratorDict;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  self->_notificationPort = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_iteratorDict;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[NSMutableDictionary objectForKey:](self->_iteratorDict, "objectForKey:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              IOObjectRelease(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "unsignedIntValue"));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  iteratorDict = self->_iteratorDict;
  self->_iteratorDict = 0;

  self->_isDetectingDisplays = 0;
}

- (void)removeAutodetectBLEIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  SCROBrailleDisplayAutoDetector *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _SCROD_BRAILLE_LOG();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Stop autodetecting ble: %@", buf, 0xCu);
  }

  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableArray removeObject:](self->_bleIdentifiers, "removeObject:", v4);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = self;
    -[SCROBrailleDisplayAutoDetector centralManager](self, "centralManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          _SCROD_BRAILLE_LOG();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_impl(&dword_2115BB000, v13, OS_LOG_TYPE_DEFAULT, "Checking peripheral %@", buf, 0xCu);
          }

          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v4, "isEqualToString:", v15);

          if (v16)
          {
            -[SCROBrailleDisplayAutoDetector centralManager](v18, "centralManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "cancelPeripheralConnection:", v12);

            if (libAccessibilityLibraryCore())
              soft__AXSVoiceOverTouchSetTactileGraphicsDisplay(0);
            goto LABEL_17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_17:

  }
}

- (void)addAutodetectBLEIdentifier:(id)a3
{
  CBCentralManager *v4;
  NSObject *v5;
  CBCentralManager *centralManager;
  CBCentralManager *v7;
  CBCentralManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CBCentralManager *v16;
  NSObject *v17;
  NSMutableArray *bleIdentifiers;
  void *v19;
  void *v20;
  void *v21;
  CBCentralManager *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  CBCentralManager *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (CBCentralManager *)a3;
  if (!self->_centralManager)
  {
    _SCROD_LOG();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      centralManager = self->_centralManager;
      *(_DWORD *)buf = 138412290;
      v29 = centralManager;
      _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Auto detect BTLE devices: %@", buf, 0xCu);
    }

    v7 = (CBCentralManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB220]), "initWithDelegate:queue:", self, 0);
    v8 = self->_centralManager;
    self->_centralManager = v7;

  }
  _SCROD_BRAILLE_LOG();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, "Autodetect ble: %@", buf, 0xCu);
  }

  if (v4 && (-[NSMutableArray containsObject:](self->_bleIdentifiers, "containsObject:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_bleIdentifiers, "addObject:", v4);
  v22 = v4;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SCROBrailleDisplayAutoDetector centralManager](self, "centralManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(CBCentralManager **)(*((_QWORD *)&v23 + 1) + 8 * i);
        _SCROD_BRAILLE_LOG();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v16;
          _os_log_impl(&dword_2115BB000, v17, OS_LOG_TYPE_DEFAULT, "Checking peripheral %@", buf, 0xCu);
        }

        bleIdentifiers = self->_bleIdentifiers;
        -[CBCentralManager identifier](v16, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(bleIdentifiers) = -[NSMutableArray containsObject:](bleIdentifiers, "containsObject:", v20);

        if ((_DWORD)bleIdentifiers)
        {
          -[SCROBrailleDisplayAutoDetector centralManager](self, "centralManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCROBrailleDisplayAutoDetector _addBLEPeripheral:central:](self, "_addBLEPeripheral:central:", v16, v21);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

- (void)startBLEAutodetect
{
  -[SCROBrailleDisplayAutoDetector centralManagerDidUpdateState:](self, "centralManagerDidUpdateState:", self->_centralManager);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *bleIdentifiers;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == 5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SCROBrailleDisplayAutoDetector centralManager](self, "centralManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v25;
      *(_QWORD *)&v9 = 138412290;
      v23 = v9;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          bleIdentifiers = self->_bleIdentifiers;
          objc_msgSend(v13, "identifier", v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(bleIdentifiers) = -[NSMutableArray containsObject:](bleIdentifiers, "containsObject:", v16);

          if ((_DWORD)bleIdentifiers)
          {
            _SCROD_BRAILLE_LOG();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v31 = v13;
              _os_log_impl(&dword_2115BB000, v17, OS_LOG_TYPE_DEFAULT, "Checking peripheral power on %@", buf, 0xCu);
            }

            -[SCROBrailleDisplayAutoDetector _addBLEPeripheral:central:](self, "_addBLEPeripheral:central:", v13, v4);
          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v10);
    }

    v18 = objc_msgSend(v4, "isScanning");
    _SCROD_LOG();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v4;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_2115BB000, v19, OS_LOG_TYPE_DEFAULT, "Starting scan: %@ scanning: %@", buf, 0x16u);

    }
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v4, "setDelegate:", self);
      v21 = *MEMORY[0x24BDBB188];
      v28[0] = *MEMORY[0x24BDBB058];
      v28[1] = v21;
      v29[0] = MEMORY[0x24BDBD1C8];
      v29[1] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scanForPeripheralsWithServices:options:", 0, v22);

    }
  }
  else if (v5 == 4)
  {
    objc_msgSend(v4, "stopScan");
  }

}

- (void)_addBLEPeripheral:(id)a3 central:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  SCROIODotPadElement *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[24];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _SCROD_LOG();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138412546;
    *(_QWORD *)&v26[4] = v6;
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v9;
    _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "Trying to add peripheral %@ %@", v26, 0x16u);

  }
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("DotPad"));

  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("DotMini"));

  if ((v11 | v13) == 1)
  {
    v14 = -[SCROIODotPadElement initWithCentral:peripheral:]([SCROIODotPadElement alloc], "initWithCentral:peripheral:", v7, v6);
    _SCROD_LOG();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 138412546;
      *(_QWORD *)&v26[4] = v14;
      *(_WORD *)&v26[12] = 2112;
      *(_QWORD *)&v26[14] = v6;
      _os_log_impl(&dword_2115BB000, v15, OS_LOG_TYPE_DEFAULT, "Matched dot pad element: %@ %@", v26, 0x16u);
    }

    if (v11 && libAccessibilityLibraryCore())
    {
      *(_QWORD *)v26 = 0;
      *(_QWORD *)&v26[8] = v26;
      *(_QWORD *)&v26[16] = 0x2020000000;
      v16 = get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr;
      v27 = get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr;
      if (!get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr)
      {
        v17 = (void *)libAccessibilityLibrary();
        v16 = dlsym(v17, "_AXSVoiceOverTouchCopyTactileGraphicsDisplay");
        *(_QWORD *)(*(_QWORD *)&v26[8] + 24) = v16;
        get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr = v16;
      }
      _Block_object_dispose(v26, 8);
      if (!v16)
        -[SCROBrailleDisplayAutoDetector _addBLEPeripheral:central:].cold.1();
      v19 = (void *)((uint64_t (*)(uint64_t))v16)(v18);
      objc_msgSend(v6, "identifier", *(_QWORD *)v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "isEqualToString:", v21);

      if ((v22 & 1) == 0)
      {
        objc_msgSend(v6, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        soft__AXSVoiceOverTouchSetTactileGraphicsDisplay((uint64_t)v24);

      }
    }
    -[SCROIODotPadElement dotFamilyIdentifier](v14, "dotFamilyIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _postBrailleDisplayDetected(v25, v14);

  }
  else
  {
    objc_msgSend(v7, "connectPeripheral:options:", v6, 0);
    if ((-[NSMutableArray containsObject:](self->_connectedPeripherals, "containsObject:", v6) & 1) == 0)
      -[NSMutableArray addObject:](self->_connectedPeripherals, "addObject:", v6);
  }

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _SCROD_LOG();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2115BB000, v6, OS_LOG_TYPE_DEFAULT, "Did connect periperhal: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("DotPad"));

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "discoverServices:", 0);
  }

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("DotPad"));

  if ((v6 & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "services", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "discoverCharacteristics:forService:", 0, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("DotPad"));

  if ((v9 & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "characteristics", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v6, "readValueForCharacteristic:", v15);
          objc_msgSend(v6, "setNotifyValue:forCharacteristic:", 1, v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8;
  id v9;
  NSMutableArray *bleIdentifiers;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  bleIdentifiers = self->_bleIdentifiers;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(bleIdentifiers) = -[NSMutableArray containsObject:](bleIdentifiers, "containsObject:", v12);

  if ((_DWORD)bleIdentifiers)
  {
    objc_msgSend(v8, "stopScan");
    _SCROD_BRAILLE_LOG();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_2115BB000, v13, OS_LOG_TYPE_DEFAULT, "Discovered periperhal %@", (uint8_t *)&v14, 0xCu);
    }

    -[SCROBrailleDisplayAutoDetector _addBLEPeripheral:central:](self, "_addBLEPeripheral:central:", v9, v8);
  }

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSMutableArray *bleIdentifiers;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSMutableArray *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _SCROD_LOG();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    bleIdentifiers = self->_bleIdentifiers;
    v15 = 138412546;
    v16 = bleIdentifiers;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, "Peripheral disconnected that we're monitoring, rescanning: %@ %@", (uint8_t *)&v15, 0x16u);
  }

  v11 = self->_bleIdentifiers;
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = -[NSMutableArray containsObject:](v11, "containsObject:", v13);

  if ((_DWORD)v11)
  {
    -[SCROBrailleDisplayAutoDetector centralManagerDidUpdateState:](self, "centralManagerDidUpdateState:", v7);
    _SCROD_LOG();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2115BB000, v14, OS_LOG_TYPE_DEFAULT, "Peripheral disconnected that we're monitoring, rescanning", (uint8_t *)&v15, 2u);
    }

  }
  -[NSMutableArray removeObject:](self->_connectedPeripherals, "removeObject:", v8);

}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCentralManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_bleIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectedPeripherals, 0);
  objc_storeStrong((id *)&self->_iteratorDict, 0);
  objc_storeStrong((id *)&self->_serialSource, 0);
}

- (void)_addBLEPeripheral:central:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef soft__AXSVoiceOverTouchCopyTactileGraphicsDisplay(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCROBrailleDisplayAutoDetector.m"), 47, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
