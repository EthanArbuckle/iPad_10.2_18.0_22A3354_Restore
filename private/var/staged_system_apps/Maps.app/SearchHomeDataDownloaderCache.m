@implementation SearchHomeDataDownloaderCache

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedResults](self, "cachedResults"));

  if (v5 && -[SearchHomeDataDownloaderCache keyIsValid:](self, "keyIsValid:", v4))
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedResults](self, "cachedResults"));
  else
    v6 = 0;

  return v6;
}

- (void)replaceCachedObject:(id)a3 withKey:(id)a4
{
  GEOMapsSearchHomeResult *v6;
  GEOMapsSearchHomeResult *cachedResults;
  id v8;

  v6 = (GEOMapsSearchHomeResult *)a3;
  objc_storeStrong((id *)&self->_cachedKey, a4);
  v8 = a4;
  cachedResults = self->_cachedResults;
  self->_cachedResults = v6;

}

- (BOOL)keyIsValid:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  char v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  char v42;
  BOOL v43;
  id v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedKey](self, "cachedKey"));
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedKey](self, "cachedKey"));
  objc_msgSend(v10, "mapRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v4, "mapRect");
  v22 = v16 != v21;
  if (v18 != v23)
    v22 = 1;
  v25 = v12 != v19 || v14 != v20 || v22;

  v26 = objc_msgSend(v4, "mapType");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedKey](self, "cachedKey"));
  v28 = objc_msgSend(v27, "mapType");

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lprPowerType"));
  if (v29)
  {
LABEL_12:
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lprPowerType"));
    if (v31)
    {
      v32 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedKey](self, "cachedKey"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lprPowerType"));
      if (v34)
      {
        v35 = (void *)v34;
        v45 = v28;
        v36 = v26;
        v37 = v25;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lprPowerType"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedKey](self, "cachedKey"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lprPowerType"));
        v41 = v38 == v40;

        v25 = v37;
        v26 = v36;
        v28 = v45;

        if (v29)
          goto LABEL_21;
        goto LABEL_20;
      }

    }
    v41 = 0;
    if (v29)
      goto LABEL_21;
    goto LABEL_20;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloaderCache cachedKey](self, "cachedKey"));
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lprPowerType"));
  if (v30)
  {
    v46 = (void *)v30;
    goto LABEL_12;
  }
  v46 = 0;
  v41 = 1;
LABEL_20:

LABEL_21:
  v42 = (v6 - v9 < 900.0) & ~v25;
  if (v26 != v28)
    v42 = 0;
  v43 = v42 & v41;

  return v43;
}

- (SearchHomeDataDownloaderCacheKey)cachedKey
{
  return self->_cachedKey;
}

- (void)setCachedKey:(id)a3
{
  objc_storeStrong((id *)&self->_cachedKey, a3);
}

- (GEOMapsSearchHomeResult)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_cachedKey, 0);
}

@end
