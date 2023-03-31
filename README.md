# ec2-launch

## 參考文件
[Using Amazon EC2 with the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2.html)
## 進階設定
儲存(裝置)
 * [Block device mappings](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html)
 * [describe-images](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)
 ```
 aws ec2 describe-images --image-ids ami-02f97949d306b597a
 ```

使用spot(省錢)
 * spot管理頁：[Spot Requests](https://console.aws.amazon.com/ec2/home#SpotInstances)
 * 定價：[Amazon EC2 Spot Instances Pricing](https://aws.amazon.com/ec2/spot/pricing/)
 * 如果設定為持續(persistent)，徹底關閉要從Spot Requests取消請求

啟動命令
 * 說明：[Run commands on your Linux instance at launch](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
 * 使用檔案的情況下，檔案路徑以`file://`作為前綴
