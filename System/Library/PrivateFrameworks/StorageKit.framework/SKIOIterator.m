@implementation SKIOIterator

- (SKIOIterator)initWithClassName:(id)a3
{
  id v4;
  mach_port_t v5;
  id v6;
  const __CFDictionary *v7;
  BOOL v8;
  NSObject *v9;
  SKIOIterator *v10;
  io_iterator_t existing;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  existing = 0;
  v5 = *MEMORY[0x24BDD8B18];
  v6 = objc_retainAutorelease(v4);
  v7 = IOServiceMatching((const char *)objc_msgSend(v6, "UTF8String"));
  if (IOServiceGetMatchingServices(v5, v7, &existing))
    v8 = 1;
  else
    v8 = existing == 0;
  if (v8)
  {
    SKGetOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_22FE50000, v9, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", buf, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:");
    v10 = self;
  }

  return v10;
}

- (unsigned)copyNextObject
{
  unsigned int result;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[SKIOIterator setAttempt:](self, "setAttempt:", 0);
  if (-[SKIOIterator attempt](self, "attempt") > 0x3E7)
  {
LABEL_5:
    SKGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = 1000;
      _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "IOKit iterator invalidated %d time(s)", (uint8_t *)v5, 8u);
    }

    return 0;
  }
  else
  {
    while (1)
    {
      result = IOIteratorNext(-[SKIOObject ioObj](self, "ioObj"));
      if (result)
        break;
      if (IOIteratorIsValid(-[SKIOObject ioObj](self, "ioObj")))
        return 0;
      -[SKIOIterator setAttempt:](self, "setAttempt:", -[SKIOIterator attempt](self, "attempt") + 1);
      MEMORY[0x2348AEC30](-[SKIOObject ioObj](self, "ioObj"));
      if (-[SKIOIterator attempt](self, "attempt") >= 0x3E8)
        goto LABEL_5;
    }
  }
  return result;
}

- (BOOL)invalidated
{
  return -[SKIOIterator attempt](self, "attempt") != 0;
}

- (unint64_t)attempt
{
  return self->_attempt;
}

- (void)setAttempt:(unint64_t)a3
{
  self->_attempt = a3;
}

@end
