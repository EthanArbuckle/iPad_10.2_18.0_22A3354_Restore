@implementation PHAPrivateFederatedLearningPackager

- (id)dataPackageFromTrainingResults:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[PHAPrivateFederatedLearningPackager _flattenTrainingResults:](self, "_flattenTrainingResults:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHAPrivateFederatedLearningPackager _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a4, 1, CFSTR("Training results are empty, will not continue."), 0);
    v7 = 0;
  }

  return v7;
}

- (id)_flattenTrainingResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D42A48]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "weightDeltas", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendVector:", v11);

        objc_msgSend(v10, "biasDeltas");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendVector:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningPackager"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (_NSRange)privacyIdentifierRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_privacyIdentifierRange.length;
  location = self->_privacyIdentifierRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)privacyIdentifierSmallRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_privacyIdentifierSmallRange.length;
  location = self->_privacyIdentifierSmallRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)privacyIdentifierLargeRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_privacyIdentifierLargeRange.length;
  location = self->_privacyIdentifierLargeRange.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
