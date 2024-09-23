@implementation BFSDirectoryEnumerator

+ (id)BFSEnumeratorWithPath:(id)a3 withDepth:(unint64_t)a4
{
  id v5;
  BFSDirectoryEnumerator *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init(BFSDirectoryEnumerator);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BFSDirectory BFSDirectoryWithURL:withDepth:](BFSDirectory, "BFSDirectoryWithURL:withDepth:", v5, a4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v7));
    -[BFSDirectoryEnumerator setDirectoryQueue:](v6, "setDirectoryQueue:", v8);

    -[BFSDirectoryEnumerator setDepth:](v6, "setDepth:", a4);
  }

  return v6;
}

- (id)getNextMatch
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlEnumerator"));

        if (!v10)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
          objc_msgSend(v25, "removeObjectAtIndex:", 0);

          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
          goto LABEL_19;
        }
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlEnumerator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextObject"));

      if (v12)
        break;
LABEL_16:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
      objc_msgSend(v21, "removeObjectAtIndex:", 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
      v23 = objc_msgSend(v22, "count");

      if (!v23)
      {
        v12 = 0;
        goto LABEL_19;
      }
    }
    while (1)
    {
      v26 = 0;
      v13 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v26, NSURLIsDirectoryKey, 0);
      v14 = v26;
      v15 = v14;
      if (!v13 || (objc_msgSend(v14, "BOOLValue") & 1) == 0)
        break;
      if (-[BFSDirectoryEnumerator depth](self, "depth"))
        v16 = (char *)objc_msgSend(v5, "remainingDepth") - 1;
      else
        v16 = 0;
      if (!-[BFSDirectoryEnumerator depth](self, "depth") || objc_msgSend(v5, "remainingDepth") && v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[BFSDirectory BFSDirectoryWithURL:withDepth:](BFSDirectory, "BFSDirectoryWithURL:withDepth:", v12, v16));
        objc_msgSend(v17, "addObject:", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlEnumerator"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nextObject"));

      v12 = (void *)v20;
      if (!v20)
        goto LABEL_16;
    }

LABEL_19:
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSMutableArray)directoryQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDirectoryQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void)setDepth:(unint64_t)a3
{
  self->_depth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryQueue, 0);
}

@end
