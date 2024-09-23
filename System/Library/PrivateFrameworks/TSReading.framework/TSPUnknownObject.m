@implementation TSPUnknownObject

- (TSPUnknownObject)initWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPUnknownObject initWithContext:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPUnknownObject.mm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 29, CFSTR("Do not call method"));

  v7 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSPUnknownObject initWithContext:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (void)willModify
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPUnknownObject willModify]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPUnknownObject.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v2, v3, 34, CFSTR("Unknown objects should never be modified."));

}

- (void)willModifyForUpgrade
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPUnknownObject willModifyForUpgrade]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPUnknownObject.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v2, v3, 39, CFSTR("Unknown objects should never be modified."));

}

- (id)packageLocator
{
  return self->_packageLocator;
}

- (OS_dispatch_data)serializedData
{
  return self->_serializedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_packageLocator, 0);
}

@end
