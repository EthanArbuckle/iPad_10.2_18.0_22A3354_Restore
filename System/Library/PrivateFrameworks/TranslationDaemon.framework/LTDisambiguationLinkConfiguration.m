@implementation LTDisambiguationLinkConfiguration

uint64_t __106___LTDisambiguationLinkConfiguration_Daemon__linkConfigurationWithEMTSelectionSpan_sourceText_targetText___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF64D8], "unvalidatedEdgeWithEMTAlternative:", a2);
}

uint64_t __118___LTDisambiguationLinkConfiguration_Daemon__linkConfigurationWithFTSelectionSpan_descriptions_sourceText_targetText___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF64D8], "unvalidatedEdgeWithFTAlternative:descriptions:", a2, *(_QWORD *)(a1 + 32));
}

@end
