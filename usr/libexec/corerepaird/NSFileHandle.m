@implementation NSFileHandle

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4));
  LOBYTE(self) = -[NSFileHandle uarpWriteData:error:](self, "uarpWriteData:error:", v5, 0);

  return (char)self;
}

- (BOOL)uarpWriteData:(id)a3 error:(id *)a4
{
  return -[NSFileHandle writeData:error:](self, "writeData:error:", a3, a4);
}

- (id)uarpReadDataUpToLength:(unint64_t)a3 error:(id *)a4
{
  return -[NSFileHandle readDataUpToLength:error:](self, "readDataUpToLength:error:", a3, a4);
}

- (BOOL)uarpSeekToOffset:(unint64_t)a3 error:(id *)a4
{
  return -[NSFileHandle seekToOffset:error:](self, "seekToOffset:error:", a3, a4);
}

- (BOOL)uarpCloseAndReturnError:(id *)a3
{
  return -[NSFileHandle closeAndReturnError:](self, "closeAndReturnError:", a3);
}

- (id)uarpReadDataToEndOfFileAndReturnError:(id *)a3
{
  return -[NSFileHandle readDataToEndOfFileAndReturnError:](self, "readDataToEndOfFileAndReturnError:", a3);
}

- (BOOL)uarpSeekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4
{
  return -[NSFileHandle seekToEndReturningOffset:error:](self, "seekToEndReturningOffset:error:", a3, a4);
}

@end
