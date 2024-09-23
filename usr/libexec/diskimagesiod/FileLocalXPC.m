@implementation FileLocalXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FileLocalXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6;
  FileLocalXPC *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  unsigned int v19;

  v6 = a3;
  v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FileLocalXPC;
  v7 = -[FileLocalXPC init](&v18, "init");
  if (v7)
  {
    v15 = (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    sub_1000BD9B8(&v15, &v19, &v16);
    v17 = v16;
    v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  return v7;
}

- (FileLocalXPC)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FileLocalXPC *v6;
  id v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  unsigned int v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FileLocalXPC;
  v6 = -[BackendXPC initWithCoder:](&v21, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSFileHandle, v5), CFSTR("file_handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v20 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_writable"));
    v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_locked"));
    v18 = dup((int)objc_msgSend(v8, "fileDescriptor"));
    sub_1000BDAF4(&v18, &v20, (char *)&v19, &v16);
    v17 = v16;
    v16 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v17, 0);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  id v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  objc_super v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = a3;
  -[BackendXPC backend](self, "backend");
  v6 = v11;
  v5 = v12;
  v13 = v11;
  v14 = v12;
  v10.receiver = self;
  v10.super_class = (Class)FileLocalXPC;
  -[BackendXPC encodeWithCoder:](&v10, "encodeWithCoder:", v4);
  v7 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 176))(v6));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("file_handle"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6), CFSTR("is_writable"));
  objc_msgSend(v4, "encodeBool:forKey:", sub_100104C00(v6), CFSTR("is_locked"));

  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

@end
