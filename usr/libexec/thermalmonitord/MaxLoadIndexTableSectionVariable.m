@implementation MaxLoadIndexTableSectionVariable

- (MaxLoadIndexTableSectionVariable)initWithDecisionTreeSection:(id)a3
{
  MaxLoadIndexTableSectionVariable *v4;
  __int128 v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;

  v12.receiver = self;
  v12.super_class = (Class)MaxLoadIndexTableSectionVariable;
  v4 = -[MaxLoadIndexTableSection init](&v12, "init");
  if (v4)
  {
    if (objc_msgSend(a3, "count") == (id)256)
    {
      v6 = 0;
      *(_QWORD *)&v5 = 134217984;
      v11 = v5;
      do
      {
        v7 = objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v6, v11), "unsignedIntValue");
        v8 = v7;
        if (v7 >= 0x66)
        {
          v9 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v11;
            v14 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "<Error> Bad DT maxLI %ld", buf, 0xCu);
          }
          LOBYTE(v8) = 101;
        }
        v4->_maxLoadIndexTableSection[v6++] = v8;
      }
      while (v6 != 256);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_1000561A8();
    }
  }
  return v4;
}

- (unint64_t)getMaxLI:(unint64_t)a3
{
  unint64_t v3;

  if (a3 > 0xFF)
    v3 = 0;
  else
    v3 = self->_maxLoadIndexTableSection[a3];
  self->super._maxLI = v3;
  return v3;
}

- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MaxLoadIndexTableSectionVariable;
  return -[MaxLoadIndexTableSection getReleaseMaxLI:releaseRate:](&v5, "getReleaseMaxLI:releaseRate:", a3, *(_QWORD *)&a4);
}

@end
