@implementation SSPlayInfoResponse

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPlayInfoResponse;
  -[SSPlayInfoResponse dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[2] = -[NSData copyWithZone:](self->_playInfoData, "copyWithZone:", a3);
  v5[1] = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_error);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_playInfoData);
  return v3;
}

- (SSPlayInfoResponse)initWithXPCEncoding:(id)a3
{
  SSPlayInfoResponse *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSPlayInfoResponse;
    v5 = -[SSPlayInfoResponse init](&v7, sel_init);
    if (v5)
    {
      v5->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      objc_opt_class();
      v5->_playInfoData = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSString)description
{
  uint64_t v3;
  objc_super v4;
  objc_super v5;

  if (self->_error)
  {
    v5.receiver = self;
    v5.super_class = (Class)SSPlayInfoResponse;
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Failed with error: %@"), -[SSPlayInfoResponse description](&v5, sel_description), self->_error, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SSPlayInfoResponse;
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Succeeded with info: %ld bytes @ %p"), -[SSPlayInfoResponse description](&v4, sel_description), -[NSData length](self->_playInfoData, "length"), self->_playInfoData);
  }
}

- (SSPlayInfoResponse)initWithPlayInfoData:(id)a3 error:(id)a4
{
  SSPlayInfoResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSPlayInfoResponse;
  v6 = -[SSPlayInfoResponse init](&v8, sel_init);
  if (v6)
  {
    v6->_error = (NSError *)a4;
    v6->_playInfoData = (NSData *)objc_msgSend(a3, "copy");
  }
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (NSData)playInfoData
{
  return self->_playInfoData;
}

@end
