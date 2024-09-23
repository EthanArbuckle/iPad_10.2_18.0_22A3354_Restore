@implementation SPLoadInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPLoadInfo;
  -[SPLoadInfo dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ @ 0x%llx-0x%llx"), -[SABinary debugDescription](self->_binary, "debugDescription"), self->_segmentName, self->_startAddress, self->_endAddress);
}

@end
