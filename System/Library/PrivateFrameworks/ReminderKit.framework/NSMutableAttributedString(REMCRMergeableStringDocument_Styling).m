@implementation NSMutableAttributedString(REMCRMergeableStringDocument_Styling)

- (void)rem_setFontHint:()REMCRMergeableStringDocument_Styling isOn:inRange:
{
  NSRange v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  NSRange v24;
  NSRange v25;
  NSRange v26;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v24.length = objc_msgSend(a1, "length");
    v24.location = 0;
    v26.location = a5;
    v26.length = a6;
    v11 = NSIntersectionRange(v24, v26);
    if (v11.length && v11.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "beginEditing");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __96__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setFontHint_isOn_inRange___block_invoke;
      v15[3] = &unk_1E67F9540;
      v16 = a4;
      v15[4] = a1;
      v15[5] = a3;
      objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v11.location, v11.length, 0x100000, v15);
      objc_msgSend(a1, "endEditing");
      +[REMLog crdt](REMLog, "crdt");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        NSStringFromRange(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v18 = a1;
        v19 = 2048;
        v20 = a3;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_INFO, "Added REMTTFontHint to this NSMutableAttributedString {self: %p, hint: %lu, range: %@}", buf, 0x20u);

      }
    }
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v25.location = a5;
      v25.length = a6;
      -[NSMutableAttributedString(REMCRMergeableStringDocument_Styling) rem_setFontHint:isOn:inRange:].cold.1((uint64_t)a1, v25, v14);
    }

  }
}

- (void)rem_setUnderline:()REMCRMergeableStringDocument_Styling inRange:
{
  NSRange v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  char v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  NSRange v21;
  NSRange v22;

  v20 = *MEMORY[0x1E0C80C00];
  v21.length = objc_msgSend(a1, "length");
  v21.location = 0;
  v22.location = a4;
  v22.length = a5;
  v9 = NSIntersectionRange(v21, v22);
  if (v9.length && v9.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "beginEditing");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setUnderline_inRange___block_invoke;
    v12[3] = &unk_1E67F9568;
    v13 = a3;
    v12[4] = a1;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v9.location, v9.length, 0x100000, v12);
    objc_msgSend(a1, "endEditing");
    +[REMLog crdt](REMLog, "crdt");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromRange(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v15 = a1;
      v16 = 1024;
      v17 = a3;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_INFO, "Added REMTTUnderline to this NSMutableAttributedString {self: %p, value: %d, range: %@}", buf, 0x1Cu);

    }
  }
}

- (void)rem_setFontHint:()REMCRMergeableStringDocument_Styling isOn:inRange:.cold.1(uint64_t a1, NSRange range, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_ERROR, "Invalid 0 value provided when trying to -rem_setFontHint:isOn:range: to this NSMutableAttributedString {self: %p, range: %@}", (uint8_t *)&v6, 0x16u);

}

@end
