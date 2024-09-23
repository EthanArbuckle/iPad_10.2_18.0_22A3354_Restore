@implementation NSItemProvider(WebPrivacyExtras)

- (void)_wp_removeTrackingInformationFromURLRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)*MEMORY[0x24BDF85F0], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_representationConformingToType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "typeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF83A8], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      v7 = WPOSLogAPI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_24A44A000, v7, OS_LOG_TYPE_INFO, "Skipping URL returned from item provider (%@)", buf, 0xCu);
      }
    }
    else
    {
      v8 = objc_msgSend(v3, "preferredRepresentation");
      v9 = objc_msgSend(v3, "visibility");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke;
      v10[3] = &unk_251BCEEB8;
      v11 = v3;
      v12 = v4;
      objc_msgSend(a1, "_addRepresentationType:preferredRepresentation:visibility:loader:", v12, v8, v9, v10);

    }
  }

}

@end
