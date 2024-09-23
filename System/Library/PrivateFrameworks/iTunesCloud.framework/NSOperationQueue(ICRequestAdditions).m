@implementation NSOperationQueue(ICRequestAdditions)

+ (id)ic_sharedRequestOperationQueueWithQualityOfService:()ICRequestAdditions
{
  uint64_t *v3;

  switch(__ROR8__(a3 - 9, 3))
  {
    case 0:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_13 != -1)
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_13, &__block_literal_global_14);
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_12;
      break;
    case 1:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken != -1)
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken, &__block_literal_global_22290);
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue;
      break;
    case 2:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_3 != -1)
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_3, &__block_literal_global_4);
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2;
      break;
    case 3:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_8 != -1)
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_8, &__block_literal_global_9);
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_7;
      break;
    default:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_18 != -1)
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_18, &__block_literal_global_19);
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_17;
      break;
  }
  return (id)*v3;
}

@end
