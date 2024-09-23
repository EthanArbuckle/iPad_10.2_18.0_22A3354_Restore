@implementation TIRecentInputs

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[TILexicon entries](self, "entries", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILexicon lexiconWithEntries:](TIRecentInputs, "lexiconWithEntries:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(v5 + 16) = self->_needsSync;
  v6 = -[NSString copy](self->_filePath, "copy");
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  return (id)v5;
}

- (id)lexiconWithAdditionalEntry:(id)a3 maximumSize:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[TILexicon entries](self, "entries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = objc_msgSend(v8, "indexOfObject:", v6);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "removeObjectAtIndex:", v9);
  objc_msgSend(v8, "insertObject:atIndex:", v6, 0);
  v10 = v8;
  v11 = v10;
  if (objc_msgSend(v10, "count") > (unint64_t)a4)
  {
    objc_msgSend(v10, "subarrayWithRange:", 0, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[TILexicon lexiconWithEntries:](TIRecentInputs, "lexiconWithEntries:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsSync:", 1);
  -[TIRecentInputs filePath](self, "filePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFilePath:", v13);

  return v12;
}

- (id)lexiconByRemovingEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[TILexicon entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v6, "indexOfObject:", v4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "removeObjectAtIndex:", v7);
  +[TILexicon lexiconWithEntries:](TIRecentInputs, "lexiconWithEntries:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsSync:", 1);
  -[TIRecentInputs filePath](self, "filePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilePath:", v9);

  return v8;
}

- (void)storeIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[TIRecentInputs needsSync](self, "needsSync"))
  {
    -[TIRecentInputs filePath](self, "filePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v4 = (void *)MEMORY[0x1E0C99E98];
        -[TIRecentInputs filePath](self, "filePath");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fileURLWithPath:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "writeToURL:atomically:", v6, 1);

      }
      -[TIRecentInputs setNeedsSync:](self, "setNeedsSync:", 0);

    }
  }
}

- (BOOL)needsSync
{
  return self->_needsSync;
}

- (void)setNeedsSync:(BOOL)a3
{
  self->_needsSync = a3;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

+ (id)recentInputAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[TILexicon lexiconWithEntries:](TIRecentInputs, "lexiconWithEntries:", MEMORY[0x1E0C9AA60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setFilePath:", v3);

  return v7;
}

+ (void)requestLexiconForRecentInputIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      if (_recentLexiconDispatchQueue_onceToken != -1)
        dispatch_once(&_recentLexiconDispatchQueue_onceToken, &__block_literal_global_127);
      v8 = (id)_recentLexiconDispatchQueue___xpc_queue;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.lexicon-server"), 4096);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A760);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRemoteObjectInterface:", v10);

      objc_msgSend(v9, "_setQueue:", v8);
      objc_msgSend(v9, "resume");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __75__TIRecentInputs_requestLexiconForRecentInputIdentifier_completionHandler___block_invoke;
      v14[3] = &unk_1E243A720;
      v11 = v7;
      v15 = v11;
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        objc_msgSend(v12, "requestLexiconForRecentInputIdentifier:completionHandler:", v5, v11);
      else
        (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

+ (void)requestRemovalOfLexiconForRecentInputIdentifier:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (v3)
  {
    v10 = v3;
    if (_recentLexiconDispatchQueue_onceToken != -1)
      dispatch_once(&_recentLexiconDispatchQueue_onceToken, &__block_literal_global_127);
    v4 = (objc_class *)MEMORY[0x1E0CB3B38];
    v5 = (id)_recentLexiconDispatchQueue___xpc_queue;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.lexicon-server"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A760);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    objc_msgSend(v6, "_setQueue:", v5);
    objc_msgSend(v6, "resume");
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_75);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "requestRemovalOfLexiconForRecentInputIdentifier:", v10);

    v3 = v10;
  }

}

+ (id)_lexiconPathForLocalIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (__CFString *)a3;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("Default");
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Keyboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v7, 0);

  objc_msgSend(v7, "stringByAppendingPathComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("recents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)recentInputForIdentifier:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  if (objc_msgSend(a1, "identifierIsSystemIdentifier:", v4))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__906;
    v18 = __Block_byref_object_dispose__907;
    v19 = 0;
    v5 = dispatch_semaphore_create(0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__TIRecentInputs_recentInputForIdentifier___block_invoke;
    v11[3] = &unk_1E24390A0;
    v12 = v5;
    v13 = &v14;
    v6 = v5;
    objc_msgSend(a1, "requestLexiconForRecentInputIdentifier:completionHandler:", v4, v11);
    v7 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v6, v7);
    v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else if (v4)
  {
    objc_msgSend(a1, "_lexiconPathForLocalIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recentInputAtPath:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)recentInputForIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  if (objc_msgSend(a1, "identifierIsSystemIdentifier:", v9))
  {
    objc_msgSend(a1, "requestLexiconForRecentInputIdentifier:completionHandler:", v9, v6);
  }
  else if (v9 && v6)
  {
    objc_msgSend(a1, "_lexiconPathForLocalIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recentInputAtPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
}

+ (id)_sanitizeRecentInputString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 65532);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_1E243B990);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (!objc_msgSend(v5, "length"))
  {

    v5 = 0;
  }

  return v5;
}

+ (void)storeInput:(id)a3 forLocalIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a1, "_sanitizeRecentInputString:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v7;
  if (v6
    && v7
    && (objc_msgSend(a1, "identifierIsSystemIdentifier:", v6) & 1) == 0
    && objc_msgSend(a1, "validateInputFormat:forIdentifier:", v11, v6))
  {
    objc_msgSend(a1, "recentInputForIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TILexiconEntry entryWithDocumentText:userInput:](TILexiconEntry, "entryWithDocumentText:userInput:", v11, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lexiconWithAdditionalEntry:maximumSize:", v9, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "storeIfNecessary");
  }

}

+ (void)storeInput:(id)a3 forSystemIdentifier:(id)a4 atPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_sanitizeRecentInputString:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13
    && objc_msgSend(a1, "identifierIsSystemIdentifier:", v8)
    && objc_msgSend(a1, "validateInputFormat:forIdentifier:", v13, v8))
  {
    +[TIRecentInputs recentInputAtPath:](TIRecentInputs, "recentInputAtPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TILexiconEntry entryWithDocumentText:userInput:](TILexiconEntry, "entryWithDocumentText:userInput:", v13, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lexiconWithAdditionalEntry:maximumSize:", v11, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "storeIfNecessary");
  }

}

+ (void)removeInput:(id)a3 forSystemIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a1, "_sanitizeRecentInputString:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(a1, "identifierIsSystemIdentifier:", v6))
  {
    objc_msgSend(a1, "_lexiconPathForLocalIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIRecentInputs recentInputAtPath:](TIRecentInputs, "recentInputAtPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TILexiconEntry entryWithDocumentText:userInput:](TILexiconEntry, "entryWithDocumentText:userInput:", v11, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lexiconByRemovingEntry:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "storeIfNecessary");
  }

}

+ (void)storeInput:(id)a3 forSystemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(a1, "_sanitizeRecentInputString:", v6);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (objc_msgSend(a1, "identifierIsSystemIdentifier:", v8)
        && objc_msgSend(a1, "validateInputFormat:forIdentifier:", v15, v8))
      {
        if (_recentLexiconDispatchQueue_onceToken != -1)
          dispatch_once(&_recentLexiconDispatchQueue_onceToken, &__block_literal_global_127);
        v9 = (objc_class *)MEMORY[0x1E0CB3B38];
        v10 = (id)_recentLexiconDispatchQueue___xpc_queue;
        v11 = (void *)objc_msgSend([v9 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.lexicon-server"), 4096);
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A760);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRemoteObjectInterface:", v12);

        objc_msgSend(v11, "_setQueue:", v10);
        objc_msgSend(v11, "resume");
        objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_88);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          objc_msgSend(v13, "addEntryString:forRecentInputIdentifier:", v15, v8);

      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = v6;
  }

}

+ (BOOL)validateInputFormat:(id)a3 forIdentifier:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("TIEmailRecentInputIdentifier")))
  {
    if (validateInputFormat_forIdentifier__onceToken != -1)
      dispatch_once(&validateInputFormat_forIdentifier__onceToken, &__block_literal_global_91);
    v6 = objc_msgSend((id)validateInputFormat_forIdentifier__regExEmail, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")) != 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (void)clearRecentInputForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(a1, "identifierIsSystemIdentifier:"))
  {
    objc_msgSend(a1, "requestRemovalOfLexiconForRecentInputIdentifier:", v6);
  }
  else if (v6)
  {
    objc_msgSend(a1, "_lexiconPathForLocalIdentifier:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);

  }
}

+ (BOOL)identifierIsSystemIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIEmailRecentInputIdentifier")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TISearchRecentInputIdentifier"));

  return v4;
}

void __52__TIRecentInputs_validateInputFormat_forIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!validateInputFormat_forIdentifier__regExEmail)
  {
    v1 = (void *)validateInputFormat_forIdentifier__regExEmail;
    validateInputFormat_forIdentifier__regExEmail = v0;

  }
}

void __49__TIRecentInputs_storeInput_forSystemIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("UIKit sent a recents addition request to kbd but received error %@"), a2);
}

void __43__TIRecentInputs_recentInputForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __66__TIRecentInputs_requestRemovalOfLexiconForRecentInputIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("UIKit sent a recents removal request to kbd but received error %@"), a2);
}

uint64_t __75__TIRecentInputs_requestLexiconForRecentInputIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("UIKit sent a recents request to kbd but received error %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
