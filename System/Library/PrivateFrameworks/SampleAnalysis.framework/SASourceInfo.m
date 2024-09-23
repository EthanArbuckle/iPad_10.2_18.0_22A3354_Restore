@implementation SASourceInfo

+ (_QWORD)sourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:
{
  id v10;
  _QWORD *v11;
  void *v12;

  v10 = a6;
  v11 = objc_alloc_init((Class)objc_opt_self());
  v11[2] = a2;
  v11[3] = a3;
  *((_DWORD *)v11 + 2) = a4;
  *((_DWORD *)v11 + 3) = a5;
  v12 = (void *)v11[4];
  v11[4] = v10;

  return v11;
}

- (NSString)fileName
{
  return (NSString *)-[NSString copyLastPathComponent](self->_filePath);
}

- (id)debugDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%d,%d (0x%llx-0x%llx)"), self->_filePath, self->_lineNum, self->_columnNum, self->_offsetIntoSegment, self->_length + self->_offsetIntoSegment);
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)lineNum
{
  return self->_lineNum;
}

- (unsigned)columnNum
{
  return self->_columnNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
