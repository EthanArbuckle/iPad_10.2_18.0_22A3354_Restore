@implementation WFOnScreenContent

- (WFOnScreenContent)initWithURL:(id)a3 file:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  WFOnScreenContent *v10;
  WFOnScreenContent *v11;
  WFOnScreenContent *v12;
  void *v14;
  objc_super v15;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOnScreenContent.m"), 17, CFSTR("WFOnScreenContent must be initialized with a URL or a file"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFOnScreenContent;
  v10 = -[WFOnScreenContent init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_URL, a3);
    objc_storeStrong((id *)&v11->_file, a4);
    v12 = v11;
  }

  return v11;
}

- (WFOnScreenContent)initWithCoder:(id)a3
{
  id v4;
  WFOnScreenContent *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  INFile *file;
  WFOnScreenContent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFOnScreenContent;
  v5 = -[WFOnScreenContent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
    v8 = objc_claimAutoreleasedReturnValue();
    file = v5->_file;
    v5->_file = (INFile *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFOnScreenContent URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[WFOnScreenContent file](self, "file");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("file"));

}

- (NSURL)URL
{
  return self->_URL;
}

- (INFile)file
{
  return self->_file;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
