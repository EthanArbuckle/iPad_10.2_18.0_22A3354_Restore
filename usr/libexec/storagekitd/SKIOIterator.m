@implementation SKIOIterator

- (SKIOIterator)initWithClassName:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  SKIOIterator *v9;
  io_iterator_t existing;
  uint8_t buf[4];
  id v13;

  existing = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = IOServiceMatching((const char *)objc_msgSend(v4, "UTF8String"));
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing))
    v6 = 1;
  else
    v6 = existing == 0;
  if (v6)
  {
    v7 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", buf, 0xCu);
    }

    v9 = 0;
  }
  else
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:");
    v9 = self;
  }

  return v9;
}

- (unsigned)copyNextObject
{
  unsigned int result;
  id v4;
  NSObject *v5;
  _DWORD v6[2];

  -[SKIOIterator setAttempt:](self, "setAttempt:", 0);
  if (-[SKIOIterator attempt](self, "attempt") > 0x3E7)
  {
LABEL_5:
    v4 = sub_10000BA9C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = 1000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "IOKit iterator invalidated %d time(s)", (uint8_t *)v6, 8u);
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
      -[SKIOIterator setAttempt:](self, "setAttempt:", (char *)-[SKIOIterator attempt](self, "attempt") + 1);
      IOIteratorReset(-[SKIOObject ioObj](self, "ioObj"));
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
