@implementation TIMecabraSegment

+ (void)splitSegments:(id)a3 at:(int)a4 forPrefix:(id *)a5 forSuffix:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = objc_msgSend(v18, "count");
  if (v10 < 1)
  {
    v13 = 0;
    if (a5)
LABEL_10:
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = v10 - a4;
    do
    {
      if (v12 >= v14)
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reading");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v9;
      }
      else
      {
        if (!v13)
          v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "surface");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13;
      }
      objc_msgSend(v17, "appendString:", v16);

      ++v12;
    }
    while (v11 != v12);
    if (a5)
      goto LABEL_10;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v9);

}

- (NSString)reading
{
  return self->_reading;
}

- (void)setReading:(id)a3
{
  objc_storeStrong((id *)&self->_reading, a3);
}

- (NSString)surface
{
  return self->_surface;
}

- (void)setSurface:(id)a3
{
  objc_storeStrong((id *)&self->_surface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);
  objc_storeStrong((id *)&self->_reading, 0);
}

@end
