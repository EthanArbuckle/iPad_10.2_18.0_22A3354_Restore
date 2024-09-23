@implementation MBDomain

- (BOOL)adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:(id *)a3 path:(id)a4
{
  id v6;
  unsigned int v7;
  $E6F833BB8BBD3354268711ADAA17EEF5 *v8;
  __int16 v9;
  BOOL v10;
  void *v12;
  unsigned __int8 v13;

  v6 = a4;
  v7 = MBMobileUID();
  if ((-[MBDomain isSystemContainerDomain](self, "isSystemContainerDomain") & 1) != 0
    || (-[MBDomain isSystemSharedContainerDomain](self, "isSystemSharedContainerDomain") & 1) != 0
    || -[MBDomain isPlaceholderAppDomain](self, "isPlaceholderAppDomain"))
  {
    a3->var2 = v7;
    a3->var3 = v7;
    if (sub_10007EF10(a3))
    {
      v8 = a3;
      v9 = 493;
    }
    else
    {
      v8 = a3;
      v9 = 420;
    }
    sub_10007EF58(v8, v9);
  }
  else
  {
    if (a3->var2
      || sub_10007EF38(a3)
      || !-[MBDomain isCameraRollDomain](self, "isCameraRollDomain")
      || !sub_10007EF24(a3)
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDomain rootPath](self, "rootPath")),
          v13 = objc_msgSend(v12, "isEqualToString:", v6),
          v12,
          (v13 & 1) != 0))
    {
      v10 = 0;
      goto LABEL_9;
    }
    a3->var2 = v7;
    a3->var3 = v7;
  }
  v10 = 1;
LABEL_9:

  return v10;
}

@end
