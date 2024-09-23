@implementation WFVariableFieldUtilities

+ (BOOL)clipboardContainsVariableString
{
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "pasteboardContainsVariableString:", v3);

  return (char)a1;
}

+ (BOOL)pasteboardContainsVariableString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("is.workflow.my.variablestring");
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "containsPasteboardTypes:", v5, v7, v8);

  return (char)v3;
}

+ (void)copyVariableString:(id)a3 toPasteboard:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1770];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(v7, "stringByReplacingVariablesWithNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = CFSTR("is.workflow.my.variablestring");
  v16[0] = v11;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v13);

}

+ (id)serializedVariableStringFromPasteboard:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "valueForPasteboardType:", CFSTR("is.workflow.my.variablestring"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
