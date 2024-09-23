@implementation SUControllerDownload

+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4
{
  id v5;
  id v6;
  SUControllerDownload *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SUControllerDownload);
  v8 = (void *)objc_msgSend(v6, "copy");

  -[SUControllerDownload setDescriptor:](v7, "setDescriptor:", v8);
  v9 = (void *)objc_msgSend(v5, "copy");

  -[SUControllerDownload setProgress:](v7, "setProgress:", v9);
  return v7;
}

- (SUControllerDownload)initWithDescriptor:(id)a3
{
  id v5;
  SUControllerDownload *v6;
  SUControllerDownload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUControllerDownload;
  v6 = -[SUControllerDownload init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
}

- (SUControllerDownload)initWithCoder:(id)a3
{
  id v4;
  SUControllerDownload *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SUControllerDescriptor *descriptor;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SUControllerProgress *progress;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUControllerDownload;
  v5 = -[SUControllerDownload init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("descriptor"));
    v9 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUControllerDescriptor *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("progress"));
    v14 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (SUControllerProgress *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUControllerDownload descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptor"));

  -[SUControllerDownload progress](self, "progress");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("progress"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUControllerDownload descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDownload progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Descriptor: %@\nProgress: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SUControllerDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (SUControllerProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
