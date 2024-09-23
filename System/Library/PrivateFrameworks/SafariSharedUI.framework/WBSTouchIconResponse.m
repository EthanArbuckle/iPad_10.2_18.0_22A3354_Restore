@implementation WBSTouchIconResponse

- (UIImage)touchIcon
{
  return self->_touchIcon;
}

- (UIColor)extractedBackgroundColor
{
  return self->_extractedBackgroundColor;
}

+ (id)responseWithURL:(id)a3 touchIcon:(id)a4 generated:(BOOL)a5 extractedBackgroundColor:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:touchIcon:generated:extractedBackgroundColor:", v12, v11, v6, v10);

  return v13;
}

- (WBSTouchIconResponse)initWithURL:(id)a3 touchIcon:(id)a4 generated:(BOOL)a5 extractedBackgroundColor:(id)a6
{
  id v11;
  id v12;
  WBSTouchIconResponse *v13;
  WBSTouchIconResponse *v14;
  WBSTouchIconResponse *v15;
  objc_super v17;

  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WBSTouchIconResponse;
  v13 = -[WBSSiteMetadataResponse initWithURL:](&v17, sel_initWithURL_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_touchIcon, a4);
    objc_storeStrong((id *)&v14->_extractedBackgroundColor, a6);
    v14->_generated = a5;
    v15 = v14;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextIconDownloadRetryDate, 0);
  objc_storeStrong((id *)&self->_extractedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
}

- (WBSTouchIconResponse)initWithURL:(id)a3
{

  return 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_generated)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; Touch Icon = %@; Extracted background color = %@; Generated = %@>"),
                       v4,
                       self,
                       self->_touchIcon,
                       self->_extractedBackgroundColor,
                       v5);
}

- (NSDate)nextIconDownloadRetryDate
{
  return self->_nextIconDownloadRetryDate;
}

- (void)setNextIconDownloadRetryDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextIconDownloadRetryDate, a3);
}

- (BOOL)isGenerated
{
  return self->_generated;
}

@end
