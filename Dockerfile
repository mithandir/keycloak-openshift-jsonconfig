FROM jboss/keycloak-openshift

ADD docker-entrypoint.sh /opt/jboss/
ADD application.keystore /opt/jboss/keycloak/standalone/configuration/

ENTRYPOINT [ "openshift-entrypoint.sh" ]

CMD ["start-keycloak.sh", "-b", "0.0.0.0"]
