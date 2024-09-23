@implementation ZhuGeModuleArmory

- (ZhuGeModuleArmory)initWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ZhuGeModuleArmory *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ZhuGeModuleArmory *v11;
  uint64_t v13;

  v6 = self;
  if (a3)
  {
    *a3 = 0;
    v6 = -[ZhuGeModuleArmory init](self, "init");
    v11 = v6;
    if (!v6)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeModule/ZhuGeModule.m", "-[ZhuGeModuleArmory initWithError:]", 29, CFSTR("Failed to initialize a module instance!"), v8, v9, v10, v13);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 18, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeModule/ZhuGeModule.m", "-[ZhuGeModuleArmory initWithError:]", 21, CFSTR("error p-pointer is nil!"), v3, v4, v5, v13);
    v11 = 0;
  }

  return v11;
}

@end
