@implementation SSLogFileOptions

- (SSLogFileOptions)init
{
  SSLogFileOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLogFileOptions;
  result = -[SSLogFileOptions init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_maxNumberOfLogFiles = xmmword_1A27A0D40;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLogFileOptions;
  -[SSLogFileOptions dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSString copyWithZone:](self->_directoryPath, "copyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  v5[3] = self->_maxNumberOfLogFiles;
  v5[4] = self->_maxSizeInBytes;
  return v5;
}

- (NSString)logDirectoryPath
{
  return self->_directoryPath;
}

- (void)setLogDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)logFileBaseName
{
  return self->_fileName;
}

- (void)setLogFileBaseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)maxLogFileSize
{
  return self->_maxSizeInBytes;
}

- (void)setMaxLogFileSize:(unint64_t)a3
{
  self->_maxSizeInBytes = a3;
}

- (int64_t)maxNumberOfLogFiles
{
  return self->_maxNumberOfLogFiles;
}

- (void)setMaxNumberOfLogFiles:(int64_t)a3
{
  self->_maxNumberOfLogFiles = a3;
}

@end
