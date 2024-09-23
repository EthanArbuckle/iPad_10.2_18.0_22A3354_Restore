@implementation TITraceLogRecordContextEntry

- (TITraceLogRecordContextEntry)initWithToken:(id)a3 wordID:(id)a4
{
  id v7;
  id v8;
  TITraceLogRecordContextEntry *v9;
  TITraceLogRecordContextEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TITraceLogRecordContextEntry;
  v9 = -[TITraceLogRecordContextEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    objc_storeStrong((id *)&v10->_wordID, a4);
  }

  return v10;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSString)wordID
{
  return self->_wordID;
}

- (void)setWordID:(id)a3
{
  objc_storeStrong((id *)&self->_wordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordID, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
