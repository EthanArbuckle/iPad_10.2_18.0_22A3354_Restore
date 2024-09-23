@implementation WBSContentBlockerStatisticsFirstParty

- (WBSContentBlockerStatisticsFirstParty)initWithDomain:(id)a3 lastSeen:(double)a4
{
  id v7;
  WBSContentBlockerStatisticsFirstParty *v8;
  WBSContentBlockerStatisticsFirstParty *v9;
  WBSContentBlockerStatisticsFirstParty *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSContentBlockerStatisticsFirstParty;
  v8 = -[WBSContentBlockerStatisticsFirstParty init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_domain, a3);
    v9->_lastSeen = a4;
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WBSContentBlockerStatisticsFirstParty *v4;
  WBSContentBlockerStatisticsFirstParty *v5;
  BOOL v6;

  v4 = (WBSContentBlockerStatisticsFirstParty *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqualToString:](v5->_domain, "isEqualToString:", self->_domain))
        v6 = v5->_lastSeen == self->_lastSeen;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_domain, "hash") ^ (unint64_t)self->_lastSeen;
}

- (NSString)domain
{
  return self->_domain;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
