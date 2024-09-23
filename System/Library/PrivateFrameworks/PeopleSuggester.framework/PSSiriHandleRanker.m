@implementation PSSiriHandleRanker

void __45___PSSiriHandleRanker_rankedHandles_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke_cold_1((uint64_t)v2, v3);

}

void __45___PSSiriHandleRanker_rankedHandles_context___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
