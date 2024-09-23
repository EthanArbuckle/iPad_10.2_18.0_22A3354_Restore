@implementation PLIsInternalTool

void __PLIsInternalTool_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v0) = objc_msgSend(v1, "isEqualToString:", CFSTR("photosctl"));
  if ((v0 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("plphotosctl"));
  if ((v2 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v4, "processName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v4,
        LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("xctest")),
        v5,
        (v4 & 1) != 0))
  {
LABEL_4:
    v6 = 1;
  }
  else
  {
    v6 = NSClassFromString((NSString *)CFSTR("XCTestProbe")) != 0;
  }
  PLIsInternalTool_isInternalTool = v6;
}

@end
