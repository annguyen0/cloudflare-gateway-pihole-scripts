#!/bin/bash

node download_lists.js blocklist
source $(dirname "$0")/lib/helpers.sh

# declare an array of urls
urls=(
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt
  https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_14_Annoyances/filter.txt
  https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_15_DnsFilter/filter.txt
  https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_19_Annoyances_Popups/filter.txt
  https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_21_Annoyances_Other/filter.txt
  https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_22_Annoyances_Widgets/filter.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_adblock.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_gambling.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_privacy.txt
  https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts
  https://adaway.org/hosts.txt
  https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
)

# download all files in parallel and append them to input.csv
download_lists $urls 'input.csv'

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
