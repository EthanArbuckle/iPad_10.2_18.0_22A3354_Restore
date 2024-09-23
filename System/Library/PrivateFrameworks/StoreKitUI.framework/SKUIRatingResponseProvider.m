@implementation SKUIRatingResponseProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  -[ISDataProvider contentType](self, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && objc_msgSend(v7, "rangeOfString:options:", CFSTR("text/html"), 1) != 0x7FFFFFFFFFFFFFFFLL
    && (v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("success")),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIRatingResponseProvider;
    v11 = -[ISProtocolDataProvider parseData:returningError:](&v13, sel_parseData_returningError_, v6, a4);
  }

  return v11;
}

@end
