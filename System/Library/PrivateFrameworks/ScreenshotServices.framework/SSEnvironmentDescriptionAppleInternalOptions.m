@implementation SSEnvironmentDescriptionAppleInternalOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSEnvironmentDescriptionAppleInternalOptions)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSEnvironmentDescriptionAppleInternalOptions *v5;
  uint64_t v6;
  SSUIRunPPTServiceRequest *runPPTServiceRequest;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  RCPMovie *recapMovie;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SSEnvironmentDescriptionAppleInternalOptions init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentDescriptionAppleInternalOptionsRunPPTServiceRequest"));
  v6 = objc_claimAutoreleasedReturnValue();
  runPPTServiceRequest = v5->_runPPTServiceRequest;
  v5->_runPPTServiceRequest = (SSUIRunPPTServiceRequest *)v6;

  if (!RecapLibraryCore_frameworkLibrary)
  {
    v19 = xmmword_24D06B9C8;
    v20 = 0;
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RecapLibraryCore_frameworkLibrary)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("SSEnvironmentDescriptionAppleInternalRecapKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v9 = (void *)getRCPMovieClass_softClass;
      v18 = getRCPMovieClass_softClass;
      if (!getRCPMovieClass_softClass)
      {
        *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v19 + 1) = 3221225472;
        v20 = __getRCPMovieClass_block_invoke;
        v21 = &unk_24D06B990;
        v22 = &v15;
        __getRCPMovieClass_block_invoke((uint64_t)&v19);
        v9 = (void *)v16[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v15, 8);
      v11 = [v10 alloc];
      v12 = objc_msgSend(v11, "initWithXPC:", v8, v15);
      recapMovie = v5->_recapMovie;
      v5->_recapMovie = (RCPMovie *)v12;

    }
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SSEnvironmentDescriptionAppleInternalOptions runPPTServiceRequest](self, "runPPTServiceRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSEnvironmentDescriptionAppleInternalOptionsRunPPTServiceRequest"));

  -[SSEnvironmentDescriptionAppleInternalOptions recapMovie](self, "recapMovie");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    if (!RecapLibraryCore_frameworkLibrary)
      RecapLibraryCore_frameworkLibrary = _sl_dlopen();
    v8 = RecapLibraryCore_frameworkLibrary;

    if (v8)
    {
      -[SSEnvironmentDescriptionAppleInternalOptions recapMovie](self, "recapMovie");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encodeToXPC");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeXPCObject:forKey:", v10, CFSTR("SSEnvironmentDescriptionAppleInternalRecapKey"));

    }
  }

}

- (SSUIRunPPTServiceRequest)runPPTServiceRequest
{
  return self->_runPPTServiceRequest;
}

- (void)setRunPPTServiceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_runPPTServiceRequest, a3);
}

- (RCPMovie)recapMovie
{
  return self->_recapMovie;
}

- (void)setRecapMovie:(id)a3
{
  objc_storeStrong((id *)&self->_recapMovie, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recapMovie, 0);
  objc_storeStrong((id *)&self->_runPPTServiceRequest, 0);
}

@end
