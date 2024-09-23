@implementation LTDisambiguationNode

id __75___LTDisambiguationNode_Daemon__nodeFromEMTResult_sourceText_romanization___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __75___LTDisambiguationNode_Daemon__nodeFromEMTResult_sourceText_romanization___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF63D0], "linkConfigurationWithEMTSelectionSpan:sourceText:targetText:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __104___LTDisambiguationNode_Daemon__nodeFromFTSpeechTranslationPhrase_descriptions_sourceText_censorSpeech___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF63D0], "linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:", a2, a1[4], a1[5], a1[6]);
}

uint64_t __85___LTDisambiguationNode_Daemon__nodeFromFTTranslationPhrase_descriptions_sourceText___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF63D0], "linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:", a2, a1[4], a1[5], a1[6]);
}

uint64_t __83___LTDisambiguationNode_Daemon__nodeFromOspreyBatchPhrase_descriptions_sourceText___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF63D0], "linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:", a2, a1[4], a1[5], a1[6]);
}

@end
