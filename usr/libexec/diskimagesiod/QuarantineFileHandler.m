@implementation QuarantineFileHandler

- (QuarantineFileHandler)initWithFD:(int)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QuarantineFileHandler;
  return -[QuarantineFileHandler init](&v5, "init", *(_QWORD *)&a3, a4);
}

- (QuarantineFileHandler)initWithURL:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QuarantineFileHandler;
  return -[QuarantineFileHandler init](&v5, "init", a3, a4);
}

- (BOOL)applyMountPointsWithBSDName:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)getFileInfoWithError:(id *)a3
{
  return 0;
}

- (BOOL)isQuarantined
{
  return self->_isQuarantined;
}

@end
