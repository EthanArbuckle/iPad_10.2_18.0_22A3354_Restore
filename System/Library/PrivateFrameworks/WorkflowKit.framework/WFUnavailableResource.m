@implementation WFUnavailableResource

- (void)refreshAvailability
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[WFResource definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFUnavailableResourceReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    WFLocalizedString(CFSTR("This action is no longer available."));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D68];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ResourceErrorDomain"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, v10);
}

@end
