//
//  DeviceMessageModel.m
//  BFXianDemo1
//
//  Created by ray on 16/7/6.
//  Copyright © 2016年 BFXian. All rights reserved.
//

#import "DeviceMessageModel.h"
//#import <UIKit/UIKit.h>
#import "sys/utsname.h"
#import <sys/types.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/sysctl.h>
@implementation DeviceMessageModel
+ (NSString *)GetCurrentDeviceModel
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    //iPhone   对照 ： https://www.theiphonewiki.com/wiki/Models#iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s (A1633/A1688/A1691/A1700)";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus (A1634/A1687/A1690/A1699)";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE (A1662/A1723/A1724)";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7 (A1660/A1779/A1780)";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7 (A1778)";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus (A1661/A1785/A1786)";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus (A1784)";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8 (A1863/A1906/A1907)";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8 (A1905)";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus (A1864/A1898/A1899)";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus (A1897)";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X (A1865/A1902)";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X (A1901)";
    
    //iPod Touch
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1 (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2 (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3 (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4 (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5 (A1421/A1509)";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod Touch 6 (A1574)";
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad (A1219/A1337)";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    if ([platform isEqualToString:@"iPad6,11"])  return @"iPad 5 (A1822)";
    if ([platform isEqualToString:@"iPad6,12"])  return @"iPad 5 (A1823)";
    if ([platform isEqualToString:@"iPad7,5"])   return @"iPad 6 (A1893)";
    if ([platform isEqualToString:@"iPad7,6"])   return @"iPad 6 (A1954)";
    
    //ipad pro
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad pro (9.7-inch/A1673)";
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad pro (9.7-inch/A1674/A1675)";
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad pro (12.9-inch/A1584)";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad pro (12.9-inch/A1652)";
    if ([platform isEqualToString:@"iPad7,1"])   return @"iPad pro2 (12.9-inch/A1670)";
    if ([platform isEqualToString:@"iPad7,2"])   return @"iPad pro2 (12.9-inch/A1671/A1821)";
    if ([platform isEqualToString:@"iPad7,3"])   return @"iPad pro (10.5-inch/A1701)";
    if ([platform isEqualToString:@"iPad7,4"])   return @"iPad pro (10.5-inch/A1709)";
    
    //iPad Air
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2 (A1566)";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2 (A1567)";
    
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad mini 1 (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad mini 1 (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad mini 1 (A1455)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad mini 2 (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad mini 2 (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad mini 2 (A1491)";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad mini 3 (A1599)";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad mini 3 (A1600)";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad mini 3 (A1601)";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad mini 4 (A1538)";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad mini 4 (A1550)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

+ (NSString *)GetName{
    return [[UIDevice currentDevice] name];
}

+ (NSString *)GetSystemName{
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)GetSystemVersion{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)GetHostIP{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

+(NSDictionary *)GetPublicIP{
    NSError *error;
    NSURL *ipURL = [NSURL URLWithString:@"http://pv.sohu.com/cityjson?ie=utf-8"];
    NSMutableString *ip = [NSMutableString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    //判断返回字符串是否为所需数据
    if ([ip hasPrefix:@"var returnCitySN = "]) {
        //对字符串进行处理，然后进行json解析
        //删除字符串多余字符串
        NSRange range = NSMakeRange(0, 19);
        [ip deleteCharactersInRange:range];
        NSString * nowIp =[ip substringToIndex:ip.length-1];
        //将字符串转换成二进制进行Json解析
        NSData * data = [nowIp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        return dict;
    }
    return nil;
}

+ (NSString *)GetUUID{
    return [NSString stringWithFormat:@"%@", [[UIDevice currentDevice].identifierForVendor UUIDString]];
}

+ (NSString *)GetAPPVersion{
    NSString *appVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    CGFloat appVersion = [appVersionString floatValue];
//    appVersionString = [NSString stringWithFormat:@"%.1f",appVersion];
    return appVersionString;
}

@end
