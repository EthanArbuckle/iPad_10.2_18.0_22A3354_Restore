@implementation WBSHistoryServiceURLCompletionMatchEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryServiceURLCompletionMatchEntry)init
{

  return 0;
}

- (WBSHistoryServiceURLCompletionMatchEntry)initWithURLString:(id)a3 title:(id)a4 topSitesScore:(float)a5 visitCountScore:(int64_t)a6
{
  __CFString *v11;
  __CFString *v12;
  WBSHistoryServiceURLCompletionMatchEntry *v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  char *v17;
  _HistoryStreamedMatchEntry *value;
  float *p_var0;
  WBSHistoryServiceURLCompletionMatchEntry *v20;
  objc_super v22;

  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)WBSHistoryServiceURLCompletionMatchEntry;
  v13 = -[WBSHistoryServiceURLCompletionMatchEntry init](&v22, sel_init);
  if (v13)
  {
    v14 = -[__CFString lengthOfBytesUsingEncoding:](v11, "lengthOfBytesUsingEncoding:", 4);
    v15 = -[__CFString lengthOfBytesUsingEncoding:](v12, "lengthOfBytesUsingEncoding:", 4);
    v16 = v14 + v15 + 42;
    v17 = (char *)operator new(v16);
    bzero(v17, v16);
    value = v13->_streamData.__ptr_.__value_;
    v13->_streamData.__ptr_.__value_ = (_HistoryStreamedMatchEntry *)v17;
    p_var0 = (float *)v17;
    if (value)
    {
      MEMORY[0x1A85998AC](value, 0x1050C40224969E2);
      p_var0 = (float *)&v13->_streamData.__ptr_.__value_->var0;
    }
    *(_DWORD *)p_var0 = 5;
    *((_DWORD *)p_var0 + 1) = v16;
    p_var0[6] = a5;
    *((_QWORD *)p_var0 + 4) = a6;
    if (v11)
    {
      CFStringGetCString(v11, v17 + 40, v14 + 1, 0x8000100u);
      v13->_streamData.__ptr_.__value_->var1 = v17 + 40;
    }
    if (v12)
    {
      CFStringGetCString(v12, &v17[v14 + 41], v15 + 1, 0x8000100u);
      v13->_streamData.__ptr_.__value_->var2 = &v17[v14 + 41];
    }
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    v20 = v13;
  }

  return v13;
}

- (WBSHistoryServiceURLCompletionMatchEntry)initWithStreamData:(void *)a3
{
  WBSHistoryServiceURLCompletionMatchEntry *v4;
  WBSHistoryServiceURLCompletionMatchEntry *v5;
  _HistoryStreamedMatchEntry *v6;
  _HistoryStreamedMatchEntry *value;
  WBSHistoryServiceURLCompletionMatchEntry *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceURLCompletionMatchEntry;
  v4 = -[WBSHistoryServiceURLCompletionMatchEntry init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_HistoryStreamedMatchEntry **)a3;
    *(_QWORD *)a3 = 0;
    value = v4->_streamData.__ptr_.__value_;
    v5->_streamData.__ptr_.__value_ = v6;
    if (value)
      MEMORY[0x1A85998AC](value, 0x1050C40224969E2);
    v8 = v5;
  }

  return v5;
}

- (WBSHistoryServiceURLCompletionMatchEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  WBSHistoryServiceURLCompletionMatchEntry *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("topSitesScore"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visitCountScore"));
  *(float *)&v10 = v8;
  v11 = -[WBSHistoryServiceURLCompletionMatchEntry initWithURLString:title:topSitesScore:visitCountScore:](self, "initWithURLString:title:topSitesScore:visitCountScore:", v5, v6, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  float v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[WBSHistoryServiceURLCompletionMatchEntry visitCountScore](self, "visitCountScore"), CFSTR("visitCountScore"));
  -[WBSHistoryServiceURLCompletionMatchEntry topSitesScore](self, "topSitesScore");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("topSitesScore"), v4);
  -[WBSHistoryServiceURLCompletionMatchEntry url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("url"));

  -[WBSHistoryServiceURLCompletionMatchEntry title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("title"));

}

- (_HistoryStreamedMatchEntry)streamData
{
  return self->_streamData.__ptr_.__value_;
}

- (float)topSitesScore
{
  return self->_streamData.__ptr_.__value_->var3;
}

- (int64_t)visitCountScore
{
  return self->_streamData.__ptr_.__value_->var4;
}

- (NSString)url
{
  NSString *url;
  NSString *v4;
  NSString *v5;

  url = self->_url;
  if (!url)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_streamData.__ptr_.__value_->var1);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_url;
    self->_url = v4;

    url = self->_url;
  }
  return url;
}

- (NSString)title
{
  NSString *title;
  NSString *v4;
  NSString *v5;

  title = self->_title;
  if (!title)
  {
    if (self->_streamData.__ptr_.__value_->var2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_title;
      self->_title = v4;

      title = self->_title;
    }
    else
    {
      title = 0;
    }
  }
  return title;
}

- (void).cxx_destruct
{
  _HistoryStreamedMatchEntry *value;

  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  value = self->_streamData.__ptr_.__value_;
  self->_streamData.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x1A85998ACLL);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
