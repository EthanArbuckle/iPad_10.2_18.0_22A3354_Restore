@implementation EDHeaderFooter

- (void)setFooterString:(id)a3
{
  NSString *v5;
  NSString **p_mFooterString;
  NSString *mFooterString;
  NSString *v8;

  v5 = (NSString *)a3;
  mFooterString = self->mFooterString;
  p_mFooterString = &self->mFooterString;
  if (mFooterString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mFooterString, a3);
    v5 = v8;
  }

}

- (void)setHeaderString:(id)a3
{
  NSString *v5;
  NSString **p_mHeaderString;
  NSString *mHeaderString;
  NSString *v8;

  v5 = (NSString *)a3;
  mHeaderString = self->mHeaderString;
  p_mHeaderString = &self->mHeaderString;
  if (mHeaderString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mHeaderString, a3);
    v5 = v8;
  }

}

+ (id)headerFooter
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)headerString
{
  return self->mHeaderString;
}

- (id)footerString
{
  return self->mFooterString;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDHeaderFooter;
  -[EDHeaderFooter description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFooterString, 0);
  objc_storeStrong((id *)&self->mHeaderString, 0);
}

@end
