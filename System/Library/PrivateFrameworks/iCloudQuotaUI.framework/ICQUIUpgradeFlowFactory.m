@implementation ICQUIUpgradeFlowFactory

+ (Class)flowManagerClassForOfferType:(int64_t)a3
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      _ICQGetLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Unknown flow type.", (uint8_t *)&v10, 2u);
      }
      goto LABEL_6;
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
      v5 = objc_opt_class();
      if (!v5)
        goto LABEL_10;
      v6 = (void *)v5;
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v10 = 138412290;
      v11 = v6;
      v8 = "Using flow manager of class: %@";
      break;
    case 5:
      _ICQGetLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        _ICQStringForOfferType();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v4;
        _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "unexpected offer type %{public}@ - should not need a flow manager", (uint8_t *)&v10, 0xCu);

      }
LABEL_6:

      goto LABEL_10;
    default:
LABEL_10:
      v6 = (void *)objc_opt_class();
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v10 = 138412290;
      v11 = v6;
      v8 = "No flow manager was assigned. Using workaround with base class: %@";
      break;
  }
  _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
LABEL_13:

  return (Class)v6;
}

@end
