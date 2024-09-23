@implementation UIFeedbackGeneratorConfiguration

uint64_t __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  if (a2 == 1)
  {
    result = objc_msgSend(v4, "audioOutputMode");
    if (result)
      goto LABEL_3;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  result = objc_msgSend(v4, "hapticOutputMode");
  if (!result)
    goto LABEL_7;
LABEL_3:
  v6 = a1[6];
  if (v6)
    v7 = v6 | result;
  else
    v7 = 0;
LABEL_8:
  if (v7 != result)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "copy");
      v9 = *(_QWORD *)(a1[4] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    }
    v11 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    if (a2 == 1)
      return objc_msgSend(v11, "setAudioOutputMode:", v7);
    else
      return objc_msgSend(v11, "setHapticOutputMode:", v7);
  }
  return result;
}

@end
