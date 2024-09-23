@implementation PKSubcredentialProvisioningFriendPairingTransitionTable

- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  BOOL result;
  BOOL v5;

  result = 0;
  switch(a4)
  {
    case 0:
    case 1:
      return 1;
    case 3:
      v5 = a3 == 8;
      goto LABEL_12;
    case 4:
      v5 = a3 == 12;
      goto LABEL_12;
    case 8:
      v5 = a3 == 2;
      goto LABEL_12;
    case 9:
      v5 = a3 == 3;
      goto LABEL_12;
    case 10:
      v5 = a3 == 9;
      goto LABEL_12;
    case 12:
      v5 = a3 == 10;
      goto LABEL_12;
    case 16:
      v5 = a3 == 3 || (a3 & 0xFFFFFFFFFFFFFFF7) == 4;
LABEL_12:
      result = v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isValidStartingState:(int64_t)a3
{
  return a3 == 2;
}

@end
