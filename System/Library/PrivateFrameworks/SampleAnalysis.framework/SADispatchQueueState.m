@implementation SADispatchQueueState

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[SARecipeState threadState](self, "threadState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SARecipeState thread](self, "thread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ (%@)"), v6, v8);

  -[SARecipeState threadState](self, "threadState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "startSampleIndex");
  if (v11 == v12)
  {
    objc_msgSend(v10, "startTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" at sample index %lu\n%@"), v13, v16);
  }
  else
  {
    v14 = objc_msgSend(v10, "endSampleIndex");
    objc_msgSend(v10, "startTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endTimestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" at sample indexes %lu-%lu\nstart:%@\n  end:%@"), v13, v14, v16, v18);

  }
  v19 = (void *)objc_msgSend(v9, "copy");

  return v19;
}

+ (id)classDictionaryKey
{
  return CFSTR("SADispatchQueueState");
}

@end
