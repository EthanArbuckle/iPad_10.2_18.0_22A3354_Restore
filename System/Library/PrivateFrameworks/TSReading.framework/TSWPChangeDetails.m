@implementation TSWPChangeDetails

- (TSWPChangeDetails)initWithChange:(id)a3 changeString:(id)a4
{
  TSWPChangeDetails *v6;
  TSWPChangeDetails *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPChangeDetails;
  v6 = -[TSWPChangeDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[TSWPChangeDetails setChange:](v6, "setChange:", a3);
    v7->mChangeString = (NSString *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPChangeDetails;
  -[TSWPChangeDetails dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[TSWPChangeDetails isEqualToChangeDetails:](self, "isEqualToChangeDetails:", a3);
  }
  return 0;
}

- (BOOL)isEqualToChangeDetails:(id)a3
{
  TSWPChange *v5;
  int v6;
  int v7;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = -[TSWPChangeDetails change](self, "change");
    if (v5 == (TSWPChange *)objc_msgSend(a3, "change"))
    {
      v6 = -[TSKAnnotationAuthor isEqual:](-[TSWPChangeDetails author](self, "author"), "isEqual:", objc_msgSend(a3, "author"));
      if (v6)
      {
        v6 = -[NSDate isEqual:](-[TSWPChangeDetails date](self, "date"), "isEqual:", objc_msgSend(a3, "date"));
        if (v6)
        {
          v6 = -[NSString isEqual:](-[TSWPChangeDetails changeTrackingString](self, "changeTrackingString"), "isEqual:", objc_msgSend(a3, "changeTrackingString"));
          if (v6)
          {
            v7 = -[TSWPChangeDetails annotationType](self, "annotationType");
            LOBYTE(v6) = v7 == objc_msgSend(a3, "annotationType");
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPChangeDetails copyWithZone:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPChangeDetails.mm"), 71, CFSTR("please don't call me"));
  return -[TSWPChangeDetails initWithChange:changeString:]([TSWPChangeDetails alloc], "initWithChange:changeString:", -[TSWPChangeDetails change](self, "change"), -[TSWPChangeDetails changeTrackingString](self, "changeTrackingString"));
}

- (TSKAnnotationAuthor)author
{
  return -[TSWPChangeSession author](-[TSWPChange session](-[TSWPChangeDetails change](self, "change"), "session"), "author");
}

- (void)setAuthor:(id)a3
{
  -[TSWPChangeSession setAuthor:](-[TSWPChange session](-[TSWPChangeDetails change](self, "change"), "session"), "setAuthor:", a3);
}

- (NSDate)date
{
  return -[TSWPChange date](-[TSWPChangeDetails change](self, "change"), "date");
}

- (NSString)changeTrackingString
{
  return self->mChangeString;
}

- (int)annotationType
{
  return 2;
}

- (int)annotationDisplayStringType
{
  return 3;
}

- (TSKModel)model
{
  return self->model;
}

- (void)setModel:(id)a3
{
  self->model = (TSKModel *)a3;
}

- (TSWPChange)change
{
  return self->_change;
}

- (void)setChange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
