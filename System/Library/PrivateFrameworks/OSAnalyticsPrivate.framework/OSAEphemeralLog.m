@implementation OSAEphemeralLog

- (OSAEphemeralLog)initWithData:(id)a3 andMetadata:(id)a4
{
  id v7;
  id v8;
  OSAEphemeralLog *v9;
  OSAEphemeralLog *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)OSAEphemeralLog;
  v9 = -[OSAEphemeralLog init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a3);
    v11 = (int)*MEMORY[0x1E0D64EF0];
    v12 = *(Class *)((char *)&v10->super.super.isa + v11);
    *(Class *)((char *)&v10->super.super.isa + v11) = (Class)CFSTR("<ephemeral>");

    v13 = objc_retainAutorelease(v7);
    *(Class *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D64F00]) = (Class)fmemopen((void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), "r");
    objc_storeStrong((id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D64EF8]), a4);
  }

  return v10;
}

- (void)retire:(const char *)a3
{
  NSData *content;

  -[OSAEphemeralLog closeFileStream](self, "closeFileStream", a3);
  content = self->_content;
  self->_content = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
