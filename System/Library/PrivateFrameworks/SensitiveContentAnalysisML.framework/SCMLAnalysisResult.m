@implementation SCMLAnalysisResult

- (SCMLAnalysisResult)initWithSensitive:(BOOL)a3 sensitivityScore:(id)a4 scoresForLabels:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  SCMLAnalysisResult *v10;

  v6 = a3;
  v8 = a4;
  +[SCMLAnalysisResult obfuscateLabels:](SCMLAnalysisResult, "obfuscateLabels:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SCMLAnalysisResult initWithSensitive:sensitivityScore:scoresForObfuscatedLabels:](self, "initWithSensitive:sensitivityScore:scoresForObfuscatedLabels:", v6, v8, v9);

  return v10;
}

- (SCMLAnalysisResult)initWithSensitive:(BOOL)a3 sensitivityScore:(id)a4 scoresForObfuscatedLabels:(id)a5
{
  id v9;
  id v10;
  SCMLAnalysisResult *v11;
  SCMLAnalysisResult *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SCMLAnalysisResult;
  v11 = -[SCMLAnalysisResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_sensitive = a3;
    objc_storeStrong((id *)&v11->_sensitivityScore, a4);
    objc_storeStrong((id *)&v12->_scoresForLabels, a5);
  }

  return v12;
}

+ (id)obfuscateLabels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("otgx_fyqmjdju"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          +[SCMLAnalysisResult obfuscateLabelName:](SCMLAnalysisResult, "obfuscateLabelName:", v12, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v14, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v5 = (id)objc_msgSend(v6, "copy");
  }

  return v5;
}

+ (id)obfuscateLabelName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v5, "characterAtIndex:", v6);
      if (v7 - 97 >= 0x19)
        v8 = v7;
      else
        v8 = v7 + 1;
      objc_msgSend(v4, "appendFormat:", CFSTR("%c"), v8);
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "length"));
  }

  return v4;
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (NSNumber)sensitivityScore
{
  return self->_sensitivityScore;
}

- (NSDictionary)scoresForLabels
{
  return self->_scoresForLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoresForLabels, 0);
  objc_storeStrong((id *)&self->_sensitivityScore, 0);
}

@end
