@implementation PUInMemoryLimitedImageTable

- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = *(void **)&self->super._indexCounter;
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v8 = *(void **)&self->super._indexCounter;
    *(_QWORD *)&self->super._indexCounter = v7;

    objc_msgSend(*(id *)&self->super._indexCounter, "setCountLimit:", 20);
    v6 = *(void **)&self->super._indexCounter;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, v9);

}

- (id)imageForItemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)&self->super._indexCounter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeItemAtIndex:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = *(void **)&self->super._indexCounter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._indexCounter, 0);
}

@end
