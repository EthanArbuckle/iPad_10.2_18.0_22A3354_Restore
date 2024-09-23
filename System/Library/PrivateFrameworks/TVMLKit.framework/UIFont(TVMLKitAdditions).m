@implementation UIFont(TVMLKitAdditions)

+ (id)tv_fontFromTextStyle:()TVMLKitAdditions fontWeight:fontSize:symbolicTraits:
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if (tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__onceToken != -1)
    dispatch_once(&tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__onceToken, &__block_literal_global_5);
  objc_msgSend((id)tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__sTextStyleMap, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    v14 = 0;
    goto LABEL_9;
  }
  v12 = 0x24BDF6000uLL;
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
LABEL_9:
    v24 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v13, "fontDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length")
    && (objc_msgSend((id)tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__sTextStyleFontWeightMap, "objectForKeyedSubscript:", v10), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = (void *)v16;
    v18 = (void *)MEMORY[0x24BDBCED8];
    v19 = *MEMORY[0x24BDF7770];
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDF7770]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setObject:forKey:", v17, *MEMORY[0x24BDF78A0]);
    v29 = v19;
    v30[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptorByAddingAttributes:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v12 = 0x24BDF6000;
    v15 = (void *)v23;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("emphasized")))
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", v11, 1024);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fontDescriptor");
    v26 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v26;
  }
  if (a6 && v15)
  {
    objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v15, "symbolicTraits") | a6);
    v27 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v27;
  }
  if (v15)
  {
    objc_msgSend(*(id *)(v12 + 2672), "fontWithDescriptor:size:", v15, a1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

LABEL_19:
  return v24;
}

@end
