@implementation UITextFieldEditingToken

void __38___UITextFieldEditingToken_endEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v3 = objc_msgSend(v2, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___UITextFieldEditingToken_endEditing__block_invoke_2;
  v5[3] = &unk_1E16B15D0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_UILastStoredDefaultTextAttributesName"), 0, v3, 0x100000, v5);

}

uint64_t __38___UITextFieldEditingToken_endEditing__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setAttributes:range:", a2, a3, a4);
  return result;
}

void __38___UITextFieldEditingToken_endEditing__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "defaultAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_UILastStoredDefaultTextAttributesName"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setDefaultAttributes:", v4);
}

@end
