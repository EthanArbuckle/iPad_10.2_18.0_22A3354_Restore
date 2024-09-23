@implementation DictationTextView.Coordinator

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtCV10WorkflowUI17DictationTextView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_220277808(v4);

}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtCV10WorkflowUI17DictationTextView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_220277ACC(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtCV10WorkflowUI17DictationTextView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_220277B9C();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtCV10WorkflowUI17DictationTextView11Coordinator *v11;
  uint64_t v12;
  uint64_t v13;

  v7 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_220277C38(v10, v12, v13, v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (_TtCV10WorkflowUI17DictationTextView11Coordinator)init
{
  sub_22012DD88();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_35();
  swift_release();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_165_2();

}

@end
