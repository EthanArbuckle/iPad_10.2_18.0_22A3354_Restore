@implementation ICPlayInfoResponse

- (ICPlayInfoResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICPlayInfoResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlayInfoResponse;
  v5 = -[ICPlayInfoResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSData)playInfoData
{
  return (NSData *)-[NSDictionary ic_dataValueForKey:](self->_responseDictionary, "ic_dataValueForKey:", CFSTR("play-info"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
