@implementation PIAutoLoopRecipeGetInstructionAtTime

uint64_t __PIAutoLoopRecipeGetInstructionAtTime_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime v11;

  memset(&v11, 0, sizeof(v11));
  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("loopFrameData_presTime"));
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v11, v5);

  memset(&v10, 0, sizeof(v10));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loopFrameData_presTime"));
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CMTimeMakeFromDictionary(&v10, v6);
  time1 = v11;
  v8 = v10;
  if (CMTimeCompare(&time1, &v8) < 0)
    return -1;
  time1 = v11;
  v8 = v10;
  return CMTimeCompare(&time1, &v8) > 0;
}

@end
