@implementation _CNVCardParsingSerialStrategy

- (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNVCardParser *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CNVCardParser initWithData:options:]([CNVCardParser alloc], "initWithData:options:", v9, v8);

  if (v10)
  {
    -[CNVCardParser resultsWithFactory:](v10, "resultsWithFactory:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

@end
